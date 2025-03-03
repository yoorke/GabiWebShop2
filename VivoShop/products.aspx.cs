using eshopBE;
using eshopBL;
using eshopUtilities;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using VivoShop.customControls.BlockSidebarControls;

namespace VivoShop
{
    public partial class products : System.Web.UI.Page
    {
        private string _categoryUrl = string.Empty;
        private string _sort = "priceAsc";
        private string _brands;
        private string[] _brandsIDs = new string[] { };
        private string _priceFrom;
        private string _priceTo;
        private string _attributes;
        private string[] _attributesIDs = new string[] { };
        private int _pageSize = 15;
        private int _currentPage = 0;
        private int _totalPages;
        private Category _category;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                checkQueryString();

                if (Page.RouteData.Values["category"] != null)
                    _categoryUrl = Page.RouteData.Values["category"].ToString();

                

                loadIntoForm();
                loadCategory();

                if(showSubcategories(_category.CategoryID) == 0 || _category.ShowProductsFromSubCategories)
                    loadProducts();
            }

            createCanonicalUrl();
        }

        private void checkQueryString()
        {
            if (Page.Request.QueryString.ToString().Contains("brands"))
            {
                _brands = Page.Request.QueryString["brands"];
                _brandsIDs = _brands.Split(',');
            }

            if (Page.Request.QueryString.ToString().Contains("priceFrom"))
                _priceFrom = Page.Request.QueryString["priceFrom"];

            if (Page.Request.QueryString.ToString().Contains("priceTo"))
                _priceTo = Page.Request.QueryString["priceTo"];

            if (Page.Request.QueryString.ToString().Contains("attributes"))
            {
                _attributes = Page.Request.QueryString["attributes"];
                _attributesIDs = _attributes.Split(',');
            }

            if (Page.Request.QueryString.ToString().Contains("pageSize"))
                int.TryParse(Page.Request.QueryString["pageSize"], out _pageSize);

            if (Page.Request.QueryString.ToString().Contains("pageIndex"))
                int.TryParse(Page.Request.QueryString["pageIndex"], out _currentPage);

            if (Page.Request.QueryString.ToString().Contains("sort"))
                _sort = Page.Request.QueryString["sort"];

            pgrPagination.CurrentPage = _currentPage;
        }

        private void loadCategory()
        {
            if (_categoryUrl.EndsWith("/"))
                _categoryUrl = _categoryUrl.Substring(0, _categoryUrl.Length - 1);

            Category category = new CategoryBL().GetCategoryByUrl(_categoryUrl, true);

            if(category == null)
            {
                //redirectIfNoExist(Request.RawUrl);
                new Redirect().RedirectCategoryUrl(Request.RawUrl);
                Server.Transfer("~/not-found.aspx");
            }
            redirectByUrl(category.FullUrl);
            _category = category;

            if (category != null)
            { 
                pageHeader.Title = category.Name;
                blockSidebar.Category = category;
                blockSidebar.CategoryUrl = _categoryUrl;

                ViewState.Add("categoryUrl", _categoryUrl);
            }
            else
                Server.Transfer("~/not-found.aspx");
        }

        private void loadProducts()
        {
            List<string> brands = new List<string>();
            foreach (string brandID in _brandsIDs)
                brands.Add(brandID);
            List<AttributeValue> attributes = new List<AttributeValue>();
            foreach (string attributeValueID in _attributesIDs)
            {
                attributes.Add(new AttributeValue(int.Parse(attributeValueID.Split('-')[1]), "-1", int.Parse(attributeValueID.Split('-')[0]), 0, string.Empty, 0));
            }
            //attributes = getFilterAttribueValues();
            string priceFrom = "0";
            string priceTo = "9999999999";

            //List<Product> products1 = new ProductBL().GetProducts(_categoryUrl, brands, attributes, _sort, priceFrom, priceTo);
            List<ProductFPView> products = new ProductViewBL().GetProducts(_categoryUrl, brands, attributes, _sort, priceFrom, priceTo);

            PagedDataSource pagedDataSource = new PagedDataSource();
            pagedDataSource.DataSource = products;
            pagedDataSource.AllowPaging = true;
            pagedDataSource.PageSize = _pageSize;
            pagedDataSource.CurrentPageIndex = _currentPage;

            _totalPages = pagedDataSource.PageCount;

            if(products != null)
            {
                pgrPagination.TotalPages = _totalPages;
                pgrPagination.CurrentPage = _currentPage;
                pgrPagination.DoPaging();
                rptProducts.DataSource = pagedDataSource;
                rptProducts.DataBind();

                lblProductsNumber.Text = "Prikazano " + (products.Count() > _pageSize ? _pageSize.ToString() : products.Count().ToString()) + " od " + products.Count().ToString();
            }
            else
            {
                rptProducts.DataSource = null;
                rptProducts.DataSourceID = null;
                rptProducts.DataBind();

                lblProductsNumber.Text = "Prikazano 0 od 0";
            }
        }

        private void loadIntoForm()
        {
            cmbSort.Items.Add(new ListItem("Nazivu", "name"));
            cmbSort.Items.Add(new ListItem("Ceni opadajuće", "priceDesc"));
            cmbSort.Items.Add(new ListItem("Ceni rastuće", "priceAsc"));
            cmbSort.SelectedValue = _sort;

            cmbPageSize.Items.Add("15");
            cmbPageSize.Items.Add("30");
            cmbPageSize.Items.Add("99");
            cmbPageSize.SelectedValue = _pageSize.ToString();
        }

        protected void cmbSort_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void cmbPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void createCanonicalUrl()
        {
            if(!string.IsNullOrWhiteSpace(ViewState["categoryUrl"].ToString()))
            {
                HtmlLink link = new HtmlLink();
                link.Attributes.Add("rel", "canonical");
                link.Attributes.Add("href", ConfigurationManager.AppSettings["webShopUrl"] + "/proizvodi/" + ViewState["categoryUrl"]);
                Header.Controls.Add(link);
            }
        }

        private int showSubcategories(int categoryID)
        {
            List<Category> subCategories = new CategoryBL().GetAllSubCategories(categoryID, false);
            rptSubCategories.DataSource = subCategories;
            rptSubCategories.DataBind();

            divSubCategories.Visible = subCategories != null && subCategories.Count > 0;

            return subCategories != null ? subCategories.Count : 0;
        }

        private void redirect(string categoryUrl)
        {
            if(bool.Parse(ConfigurationManager.AppSettings["redirectCategoryByUrl"]) && !Request.IsLocal)
            {
                //new Redirect().RedirectCategoryUrl(Request.RawUrl);
                string url = Request.Url.AbsoluteUri.Contains('?') ? Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.IndexOf('?')) : Request.Url.AbsoluteUri;
                string queryString = Request.Url.AbsoluteUri.Contains('?') ? Request.Url.AbsoluteUri.Substring(Request.Url.AbsoluteUri.IndexOf('?') + 1) : string.Empty;

                if (!(ConfigurationManager.AppSettings["webShopUrl"] + categoryUrl).Equals(url))
                {
                    ErrorLog.LogMessage(DateTime.Now.ToString() + " - Redirected: " + Request.Url.AbsoluteUri + ", to: " + ConfigurationManager.AppSettings["webShopUrl"] + categoryUrl + (queryString != string.Empty ? "?" : string.Empty) + queryString);
                    Response.RedirectPermanent(ConfigurationManager.AppSettings["webShopUrl"] + categoryUrl + (queryString != string.Empty ? "?" : string.Empty) + queryString);
                }
                //if(!(ConfigurationManager.AppSettings["webShopUrl"] + categoryUrl).Equals(Request.Url.AbsoluteUri))
                //{
                    //Response.RedirectPermanent(ConfigurationManager.AppSettings["webShopUrl"] + categoryUrl);
                    //ErrorLog.LogMessage(DateTime.Now.ToString() + " - Redirected: " + Request.Url.AbsoluteUri + ", to: " + ConfigurationManager.AppSettings["webShopUrl"] + categoryUrl);
                //}
            }
        }

        private void redirectIfNoExist(string url)
        {
            Dictionary<string, string> urls = new Dictionary<string, string>();

            string line;
            using (StreamReader sr = new StreamReader(Server.MapPath("~/categoriesRedirect.txt")))
            {
                while ((line = sr.ReadLine()) != null)
                    urls.Add(line.Split(',')[0], line.Split(',')[1]);
            }

            string queryString = url.Contains("?") ? url.Substring(url.IndexOf("?") + 1) : url;
            url = url.Contains("?") ? url.Substring(0, url.IndexOf("?")) : url;

            if (urls.ContainsKey(url))
                Response.RedirectPermanent(urls[url] + (queryString != string.Empty ? ("?" + queryString) : queryString));
        }

        private void redirectByUrl(string url)
        {
            if(bool.Parse(ConfigurationManager.AppSettings["redirectCategoryByUrl"]) && !Request.IsLocal)
            {
                if(!Request.Url.AbsolutePath.Equals(url))
                {
                    ErrorLog.LogMessage("Category redirected from: " + Request.Url.AbsolutePath + " to: " + url);
                    Response.RedirectPermanent(ConfigurationManager.AppSettings["webShopUrl"] + url + Request.Url.Query);
                }
            }
        }

        private List<AttributeValue> getFilterAttribueValues()
        {
            List<AttributeValue> attributeValues = new List<AttributeValue>();
            //foreach(RepeaterItem repeaterItem in ((BlockSidebar)blockSidebar).Controls)
            //{

            //}

            return attributeValues;
        }
    }
}
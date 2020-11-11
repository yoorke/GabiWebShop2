using eshopBE;
using eshopBL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
        private int _pageSize = 16;
        private int _currentPage = 0;
        private int _totalPages;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                checkQueryString();

                if (Page.RouteData.Values["category"] != null)
                    _categoryUrl = Page.RouteData.Values["category"].ToString();

                

                loadIntoForm();
                loadCategory();

                loadProducts();
            }
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

            Category category = new CategoryBL().GetCategoryByUrl(_categoryUrl);

            pageHeader.Title = category.Name;
        }

        private void loadProducts()
        {
            List<string> brands = new List<string>();
            List<AttributeValue> attributes = new List<AttributeValue>();
            string priceFrom = "0";
            string priceTo = "9999999999";

            List<Product> products = new ProductBL().GetProducts(_categoryUrl, brands, attributes, _sort, priceFrom, priceTo);

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
            }
            else
            {
                rptProducts.DataSource = null;
                rptProducts.DataSourceID = null;
                rptProducts.DataBind();
            }
        }

        private void loadIntoForm()
        {
            cmbSort.Items.Add(new ListItem("Nazivu", "name"));
            cmbSort.Items.Add(new ListItem("Ceni opadajuće", "priceDesc"));
            cmbSort.Items.Add(new ListItem("Ceni rastuće", "priceAsc"));
            cmbSort.SelectedValue = _sort;

            cmbPageSize.Items.Add("16");
            cmbPageSize.Items.Add("32");
            cmbPageSize.Items.Add("96");
            cmbPageSize.SelectedValue = _pageSize.ToString();
        }

        protected void cmbSort_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void cmbPageSize_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
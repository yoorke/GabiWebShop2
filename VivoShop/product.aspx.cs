using eshopBE;
using eshopBL;
using eshopUtilities;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace VivoShop
{
    public partial class product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                if (Request.QueryString != null && Request.QueryString.ToString().Contains("product"))
                    loadProduct(Request.QueryString["product"]);
                else
                    loadProduct(Page.RouteData.Values["product"] != null ? Page.RouteData.Values["product"].ToString() : string.Empty);
            }

            createCanonicalUrl();
        }

        private void loadProduct(string productName)
        {
            int productID = getProductID(productName);
            if(productID > 0)
            {
                Product product = new ProductBL().GetProduct(productID, string.Empty, true, string.Empty);

                if(product != null)
                {
                    redirect(product.Url);
                    productGallery.Images = product.Images;
                    lblProductName.Text = product.Brand.Name + " " + product.Name;
                    lblProductDescription.Text = (!string.IsNullOrWhiteSpace(product.ShortDescription) ? product.ShortDescription : product.Description) + (!product.CanBeDelivered ? "\nArtikal se ne šalje kurirskim službama" : "");
                    lblBrandName.Text = product.Brand.Name;
                    lblProductCode.Text = product.Code;
                    lblProductWebPrice.Text = string.Format("{0:N2}", product.WebPrice);

                    if(product.Promotion != null)
                    {
                        regularPriceDiv.Visible = false;
                        promotionPriceDiv.Visible = true;

                        lblPromotionPrice.Text = string.Format("{0:N2}", product.Promotion.Price);
                        lblOldPrice.Text = string.Format("{0:N2}", product.WebPrice);
                    }

                    lblProductDescriptionBottom.Text = product.Description + (!product.CanBeDelivered ? "\nArtikal se ne šalje kurirskim službama" : "");
                    lblProductSpecification.Text = !string.IsNullOrEmpty(product.Specification) ? product.Specification : "Nema podataka";
                    lblDeclaration.Text = !string.IsNullOrEmpty(product.Declaration) ? product.Declaration : "Nema podataka";
                    if (!string.IsNullOrWhiteSpace(product.Brand.LogoUrl))
                        imgBrandLogo.ImageUrl = "~/images/brand/" + product.Brand.LogoUrl;
                    else
                        imgBrandLogo.Visible = false;

                    productCarousel.CategoryID = product.Categories[0].CategoryID;
                    productCarousel.CacheData = false;
                    productCarousel.LoadProducts();

                    btnCart.Attributes.Add("onclick", "AddToCart('" + product.ProductID + "', '" + product.Name + "', event); return false;");

                    lblAvailability.Text = 
                    lblAvailability2.Text = product.IsInStock ? "Na stanju" : "Nema na stanju";
                    lblAvailability.CssClass = 
                    lblAvailability2.CssClass = product.IsInStock ? "text-success" : "text-danger";

                    if(!product.IsInStock)
                    {
                        btnCart.Attributes.Add("disabled", "true");
                        btnCart.Style.Add("background-color", "#eee");
                        btnCart.Attributes["onclick"] = "";
                        btnCart.InnerHtml = "Nema na stanju";
                        if(!bool.Parse(ConfigurationManager.AppSettings["showPriceIfNotInStock"]))
                            priceDiv.Visible = false;
                    }

                    ViewState.Add("productUrl", product.Url);

                    spanDelivery.Attributes["class"] += product.CanBeDelivered ? " allowed" : " not-allowed";
                    spanDelivery.Attributes["title"] = product.CanBeDelivered ? "Artikal se šalje kurirskom službom" : "Artikal se ne šalje kurirskom službom";
                }
                else
                {
                    Server.Transfer("~/not-found.aspx");
                }
            }
        }

        private int getProductID(string productName)
        {
            StringBuilder sb = new StringBuilder();
            for (int i = productName.Length - 1; i > 0; i--)
                if (productName[i] == '-')
                    break;
                else
                    if (char.IsDigit(productName[i]))
                    sb.Insert(0, productName[i]);

            int productID = -1;
            int.TryParse(sb.ToString(), out productID);
            return productID;
        }

        private void createCanonicalUrl()
        {
            if (ViewState["productUrl"] != null && ViewState["productUrl"].ToString() != string.Empty)
            { 
                HtmlLink link = new HtmlLink();
                link.Attributes.Add("rel", "canonical");
                link.Attributes.Add("href", ConfigurationManager.AppSettings["webShopUrl"] + ViewState["productUrl"]);
                Header.Controls.Add(link);
            }
        }

        private void redirect(string productUrl)
        {
            if(bool.Parse(ConfigurationManager.AppSettings["redirectProductByUrl"]) && !Request.IsLocal)
            {
                if (!(ConfigurationManager.AppSettings["webShopUrl"] + productUrl).Equals(Request.Url.AbsoluteUri))
                {
                    ErrorLog.LogMessage(DateTime.Now.ToString() + " - Redirected: " + Request.Url.AbsoluteUri + ", to: " + ConfigurationManager.AppSettings["webShopUrl"] + productUrl);
                    Response.RedirectPermanent(ConfigurationManager.AppSettings["webShopUrl"] + (productUrl.StartsWith("/") ? string.Empty : "/") + productUrl);
                }
            }
        }
    }
}
using eshopBE;
using eshopBL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.ProductControls
{
    public partial class ProductCardControlFPView : System.Web.UI.UserControl
    {
        private ProductFPView _product;
        private string _alternateCss;

        public ProductFPView Product
        {
            get { return _product; }
            set
            {
                _product = value;
                setValues();
            }
        }

        public string AlternateCss
        {
            get { return _alternateCss; }
            set { _alternateCss = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        private void setValues()
        {
            divBadge.Visible = false;
            lblBadgeTitle.Text = string.Empty;

            lnkProductImage.NavigateUrl = _product.Url;

            
            imgProduct.ImageUrl = new ProductBL().GetFullImageUrl(_product.ImageUrl, ConfigurationManager.AppSettings["mainName"]);

            lnkProductName.NavigateUrl = _product.Url;
            lblProductName.Text = _product.Name;

            divProductCard.Attributes["class"] = "product-card " + _alternateCss;

            Promotion promotion = null;
            if(_product.PromotionPrice > 0)
            {
                promotion = new Promotion()
                {
                    Name = "Promotion",
                    Price = _product.PromotionPrice,
                    PromotionID = -1
                };
            }

            productActions.Product = new Product() { ProductID = _product.ProductID, Price = _product.Price, WebPrice = _product.WebPrice, IsInStock = _product.IsInStock, Name = _product.BrandName + " " + _product.Name, Promotion = promotion };

            lblProductID.Value = _product.ProductID.ToString();

            if(HttpContext.Current.User.Identity.IsAuthenticated && Roles.IsUserInRole(HttpContext.Current.User.Identity.Name, "Administrator"))
            {
                lnkEditProduct.Visible = true;
                lnkEditProduct.NavigateUrl = "/" + ConfigurationManager.AppSettings["webShopAdminUrl"] + "/product.aspx?id=" + _product.ProductID;
            }

            spanDelivery.Attributes["class"] += _product.CanBeDelivered ? " allowed" : " not-allowed";
            spanDelivery.Attributes["title"] = _product.CanBeDelivered ? "Artikal se šalje kurirskom službom" : "Artikal se ne šalje kurirskom službom";
            spanInStore.Attributes["class"] += " allowed";
            spanInCity.Attributes["class"] += " allowed";
        }
    }
}
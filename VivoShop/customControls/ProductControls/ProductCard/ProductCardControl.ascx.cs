using eshopBE;
using eshopBL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.ProductControls
{
    public partial class ProductCardControl : System.Web.UI.UserControl
    {
        private Product _product;
        private string _alternateCss;

        public Product Product
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

            
            imgProduct.ImageUrl = new ProductBL().GetFullImageUrl(_product.Images[0].ImageUrl, ConfigurationManager.AppSettings["listName"]);

            lnkProductName.NavigateUrl = _product.Url;
            lblProductName.Text = _product.Name;

            divProductCard.Attributes["class"] = "product-card " + _alternateCss;

            productActions.Product = _product;
        }
    }
}
using eshopBE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.ProductControls.ProductCard
{
    public partial class ProductCardActions : System.Web.UI.UserControl
    {
        private Product _product;

        public Product Product
        {
            get { return _product; }
            set
            {
                _product = value;
                setValues();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void setValues()
        {
            btnCart.Attributes.Add("onclick", "AddToCart('" + _product.ProductID.ToString() + "', event); return false;");
            btnCart2.Attributes.Add("onclick", "AddToCart('" + _product.ProductID.ToString() + "', event); return false;");

            lblProductPrice.Text = string.Format("{0:N2}", _product.WebPrice);
        }
        
    }
}
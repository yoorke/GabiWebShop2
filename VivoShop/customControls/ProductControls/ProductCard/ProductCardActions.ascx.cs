using eshopBE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

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
            btnCart.Attributes.Add("onclick", "AddToCart('" + _product.ProductID.ToString() + "', '" + _product.Name + "', event); return false;");
            btnCart2.Attributes.Add("onclick", "AddToCart('" + _product.ProductID.ToString() + "', '" + _product.Name + "', event); return false;");

            if(!_product.IsInStock)
            {
                btnCart.Attributes.Add("disabled", "true");
                btnCart.InnerText = "Nema na stanju";
                btnCart.Style["background-color"] = "#eee";
                btnCart.Attributes["onclick"] = "";

                btnCart2.Attributes.Add("disabled", "true");
                btnCart2.InnerText = "Nema na stanju";
                btnCart2.Style["background-color"] = "#eee";
                btnCart2.Attributes["onclick"] = "";
                if(!bool.Parse(ConfigurationManager.AppSettings["showPriceIfNotInStock"]))
                    priceDiv.Visible = false;
            }

            lblProductPrice.Text = string.Format("{0:N2}", _product.WebPrice);

            if(_product.Promotion != null)
            {
                regularPriceDiv.Visible = false;
                promotionPriceDiv.Visible = true;

                lblPromotionPrice.Text = string.Format("{0:N2}", _product.Promotion.Price);
                lblOldPrice.Text = string.Format("{0:N2}", _product.WebPrice);
            }

            btnWishList.Attributes.Add("onclick", "AddToWishList(event, '" + _product.ProductID.ToString() + "'); return false;");

            btnCompare.Attributes.Add("onclick", "AddToCompare(event, '" + _product.ProductID.ToString() + "');return false;");
            lblAvailability.Text = _product.IsInStock ? "Na stanju" : "Nema na stanju";
            lblAvailability.CssClass = _product.IsInStock ? "text-success" : "text-danger";
        }
        
    }
}
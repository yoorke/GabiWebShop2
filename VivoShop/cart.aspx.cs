using eshopBL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;    

namespace VivoShop
{
    public partial class cart : System.Web.UI.Page
    {
        private double _total = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            loadCart();
        }

        private void loadCart()
        {
            rptCart.DataSource = new CartBL().GetProducts(Session["cartID"].ToString());
            rptCart.DataBind();

            calculateTotal();
        }

        protected void rptCart_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Image imgProductImage = (Image)e.Item.FindControl("imgProductImage");
                imgProductImage.ImageUrl = new ProductBL().GetFullImageUrl(imgProductImage.ImageUrl, string.Empty);
                _total += double.Parse(((Literal)e.Item.FindControl("lblTotal")).Text);
            }
        }

        private void calculateTotal()
        {
            _total = Math.Round(_total, 2);
            double subTotal = Math.Round(_total / 1.2, 2);
            double tax = Math.Round(_total - subTotal, 2);

            lblSubTotal.Text = string.Format("{0:N2}", subTotal);
            lblTax.Text = string.Format("{0:N2}", tax);
            lblTotal.Text = string.Format("{0:N2}", _total);
        }

        protected void btnUpdateCart_Click(object sender, EventArgs e)
        {
            CartBL cartBL = new CartBL();
            for(int i = 0; i < rptCart.Items.Count - 1; i++)
            {
                int quantity = 0;
                int productID = 0;

                if(int.TryParse(((Label)rptCart.Items[i].FindControl("lblProductID")).Text, out productID) &&
                   int.TryParse(((TextBox)rptCart.Items[i].FindControl("txtQuantity")).Text, out quantity))
                {
                    cartBL.UpdateProductQuantity(productID, quantity, Session["cartID"].ToString());
                }
            }

            loadCart();
        }
    }
}
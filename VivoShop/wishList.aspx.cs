using eshopBL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop
{
    public partial class wishList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
            {
                if (!Page.IsPostBack)
                    loadProducts();
            }
            else
                Response.Redirect("~/prijava?returnUrl=/lista-zelja");
        }

        private void loadProducts()
        {
            rptProducts.DataSource = new WishListBL().GetWishListProducts(int.Parse(Membership.GetUser().ProviderUserKey.ToString()));
            rptProducts.DataBind();
        }

        protected void rptProducts_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                ((Image)e.Item.FindControl("imgProductImage")).ImageUrl = new ProductBL().GetFullImageUrl(((Image)e.Item.FindControl("imgProductImage")).ImageUrl, ConfigurationManager.AppSettings["listName"]);

                ((LinkButton)e.Item.FindControl("btnAddToCart")).Attributes.Add("onclick", "AddToCart('" + ((HiddenField)e.Item.FindControl("lblProductID")).Value + "', '" + ((Label)e.Item.FindControl("lblFullName")).Text + "', event); return false");
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {

        }

        protected void rptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if(e.CommandName == "Delete")
            {
                new WishListBL().DeleteFromWishList(int.Parse(Membership.GetUser().ProviderUserKey.ToString()), int.Parse(((HiddenField)e.Item.FindControl("lblProductID")).Value));
                Response.Redirect("~/lista-zelja");
            }
        }
    }
}
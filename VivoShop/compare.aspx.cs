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
    public partial class compare : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                loadProducts();
        }

        private void loadProducts()
        {
            List<Product> products = new List<Product>();
            if (Session["compare"] != null)
            {
                List<int> productsIDs = (List<int>)Session["compare"];
                
                if(productsIDs != null)
                {
                    foreach(int id in productsIDs)
                    {
                        products.Add(new ProductBL().GetProduct(id, string.Empty, false, string.Empty));
                    }
                }
            }
            else
            {
                divStatus.Visible = true;
            }

            rptImages.DataSource = products;
            rptImages.DataBind();

            rptCode.DataSource = products;
            rptCode.DataBind();

            rptRating.DataSource = products;
            rptRating.DataBind();

            rptAvailability.DataSource = products;
            rptAvailability.DataBind();

            rptPrice.DataSource = products;
            rptPrice.DataBind();

            rptAddToCard.DataSource = products;
            rptAddToCard.DataBind();

            rptRemove.DataSource = products;
            rptRemove.DataBind();
        }

        protected void rptImages_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Image imgProductImage = (Image)e.Item.FindControl("imgProduct");
                imgProductImage.ImageUrl = new ProductBL().GetFullImageUrl(imgProductImage.ImageUrl, string.Empty);
            }
        }

        protected void rptAddToCard_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                ((LinkButton)e.Item.FindControl("btnAddToCard")).Attributes.Add("onclick", "AddToCard('" + ((HiddenField)e.Item.FindControl("lblProductID")).Value + "', event); return false;");
            }
        }

        protected void rptRemove_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                //int productID = int.Parse(((HiddenField)e.Item.FindControl("lblProductID")).Value);
                //WebMethods.DeleteFromProductCompare(productID);
                //Response.Redirect("/poredjenje-proizvoda");

                ((LinkButton)e.Item.FindControl("btnRemove")).Attributes.Add("onclick", "btnProductCompareRemove_Click('" + ((HiddenField)e.Item.FindControl("lblProductID")).Value + "', event); return false;");
            }
        }
    }
}
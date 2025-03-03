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
    public partial class search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                string searchString = string.Empty;
                string categoryID = "-1";
                if(Request.QueryString.ToString().Contains("s=") && Request.QueryString.ToString().Contains("c="))
                {
                    searchString = Request.QueryString["s"].ToString();
                    categoryID = Request.QueryString["c"].ToString();
                    pageHeader.Title = "Pretraga: " + searchString;
                    ViewState["searchString"] = searchString;
                    ViewState["categoryID"] = categoryID;
                    searchProducts();
                }
            }
        }

        private void searchProducts()
        {
            string searchString = ViewState["searchString"].ToString();
            int categoryID = -1;
            int.TryParse(ViewState["categoryID"].ToString(), out categoryID);
            List<Product> products = new ProductBL().SearchProducts(searchString, "product.Name", categoryID);

            rptProducts.DataSource = products;
            rptProducts.DataBind();
        }
    }
}
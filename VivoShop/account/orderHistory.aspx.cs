using eshopBL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.account
{
    public partial class orderHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)
                Page.Response.Redirect("/prijava?returnUrl=" + Page.Request.RawUrl);

            if (!Page.IsPostBack)
            {
                loadOrders();
            }
        }

        private void loadOrders()
        {
            rptOrders.DataSource = new OrderBL().GetOrders(-1, DateTime.Parse("2000/01/01"), DateTime.Now, int.Parse(Membership.GetUser().ProviderUserKey.ToString()));
            rptOrders.DataBind();
        }
    }
}
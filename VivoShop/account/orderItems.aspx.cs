using eshopBE;
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
    public partial class orderItems : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)
                Response.Redirect("/prijava?returnUrl=" + Page.Request.RawUrl);

            if (Page.RouteData.Values["orderID"] != null)
                loadOrder(int.Parse(Page.RouteData.Values["orderID"].ToString()));
        }

        private void loadOrder(int orderID)
        {
            Order order = new OrderBL().GetOrder(orderID);

            if (int.Parse(Membership.GetUser().ProviderUserKey.ToString()) == order.User.UserID)
            {
                pageHeader.Title = "Porudžbina broj: #" + order.Code;
                lblOrderNumber.Text = order.Code;
                lblDate.Text = order.Date.ToString("dd.MM.yyyy");
                lblStatus.Text = order.OrderStatus.Name;
                lblStatusDate.Text = "NP";

                rptOrderItems.DataSource = order.Items;
                rptOrderItems.DataBind();

                double total = 0;
                foreach (var item in order.Items)
                    total += item.UserPrice * item.Quantity;

                lblTotal.Text = string.Format("{0:N2}", total);
            }
            else
                Response.Redirect("/");
        }
    }
}
using eshopBE;
using eshopBL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.account
{
    public partial class user_dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)
                Response.Redirect("/prijava?returnUrl=" + Page.Request.RawUrl);

            if(!IsPostBack)
            {
                loadUser();
            }
        }

        private void loadUser()
        {
            User user = UserBL.GetUser(-1, HttpContext.Current.User.Identity.Name);

            lblName.Text = user.FirstName + " " + user.LastName;
            lblEmail.Text = user.Email;
            lblAddressName.Text = user.FirstName + " " + user.LastName;
            lblAddress.Text = user.Address;
            lblPhone.Text = user.Phone;
            lblAddressName.Text = user.Address;
        }
    }
}
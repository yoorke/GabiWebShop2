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
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)
                Response.Redirect("/prijava?returnUrl=" + Page.Request.RawUrl);

            if (!Page.IsPostBack)
                loadUser();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            User user = new User();
            user.UserID = int.Parse(Membership.GetUser().ProviderUserKey.ToString());
            user.FirstName = txtFirstName.Text;
            user.LastName = txtLastName.Text;
            user.Email = txtEmail.Text;
            user.Address = txtAddress.Text;
            user.Zip = txtZip.Text;
            user.City = txtCity.Text;
            user.Phone = txtPhone.Text;

            new UserBL().UpdateUserAccountData(user);
        }

        private void loadUser()
        {
            User user = UserBL.GetUser(-1, HttpContext.Current.User.Identity.Name);

            txtFirstName.Text = user.FirstName;
            txtLastName.Text = user.LastName;
            txtEmail.Text = user.Email;
            txtAddress.Text = user.Address;
            txtZip.Text = user.Zip;
            txtCity.Text = user.City;
            txtPhone.Text = user.Phone;
        }
    }
}
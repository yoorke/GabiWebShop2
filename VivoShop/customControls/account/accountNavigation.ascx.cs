using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.account
{
    public partial class accountNavigation : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string currentUrl = Request.Url.AbsolutePath.Substring(Request.Url.AbsolutePath.LastIndexOf("/"));
            switch(currentUrl)
            {
                case "/moj-nalog": liDashboard.Attributes["class"] += " account-nav__item--active"; break;
                case "/moj-profil": liProfile.Attributes["class"] += " account-nav__item--active"; break;
                case "/istorija-porucivanja": liOrderHistory.Attributes["class"] += " account-nav__item--active"; break;
                case "/izmena-sifre": liEditPassword.Attributes["class"] += " account-nav__item--active"; break;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("/");
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string returnUrl = Request.QueryString.ToString().Contains("returnUrl") ? Request.QueryString["returnUrl"] : "/";
            login1.DestinationPageUrl = returnUrl;
        }

        protected void login1_LoginError(object sender, EventArgs e)
        {

        }
    }
}
using eshopUtilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop
{
    public partial class VivoShop : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!Request.Url.PathAndQuery.Equals("/") && !Request.Url.PathAndQuery.Equals("/default.aspx"))
                //Server.Transfer("/");
                //Response.Redirect("/");
            Page.Header.DataBind();

            ErrorLog.LogMessage(DateTime.UtcNow.ToString("dd-MM-yyyy-hh:mm:ss") + "\t" + Request.UserHostAddress + "\t" + Request.RawUrl);
        }
    }
}
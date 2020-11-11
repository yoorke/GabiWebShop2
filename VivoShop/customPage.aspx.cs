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
    public partial class customPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack && Page.RouteData.Values["url"] != null)
                loadCustomPage(Page.RouteData.Values["url"].ToString());
        }

        private void loadCustomPage(string url)
        {
            if(!url.Trim().Equals(string.Empty))
            {
                CustomPage customPage = new CustomPageBL().GetCustomPage(url);
                pageHeader.Title = customPage.Title;
                lblContent.Text = customPage.Content;
            }
        }
    }
}
using eshopBL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.Navigation.Mobile
{
    public partial class MobileNavigation : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            rptRootMenu.DataSource = new CategoryBL().GetNestedCategoriesList();
            rptRootMenu.DataBind();
        }
    }
}
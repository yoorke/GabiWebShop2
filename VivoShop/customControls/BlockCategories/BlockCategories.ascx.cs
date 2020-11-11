using eshopBL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.BlockCategories
{
    public partial class BlockCategories : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                loadCategories();
            }
        }

        private void loadCategories()
        {
            rptCategories.DataSource = new CategoryBL().GetNestedCategoriesList();
            rptCategories.DataBind();
        }
    }
}
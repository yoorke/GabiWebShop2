using eshopBE;
using eshopBL;
using eshopUtilities;
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
            List<CategoryView> categories = new List<CategoryView>();

            if (Cache["MainMenu"] == null)
            {
                ErrorLog.LogMessage("Block categories create cache");
                //rptCategories.DataSource = new CategoryBL().GetNestedCategoriesList();
                 categories = new CategoryViewBL().GetNestedCategoriesList();
                Cache.Add("MainMenu", categories, null, DateTime.Now.AddMinutes(60), System.Web.Caching.Cache.NoSlidingExpiration, System.Web.Caching.CacheItemPriority.Normal, null);
            }
            else
            {
                categories = (List<CategoryView>)Cache["MainMenu"];
            }

            rptCategories.DataSource = categories;
            rptCategories.DataBind();
        }
    }
}
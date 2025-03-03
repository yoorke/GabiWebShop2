using eshopBE;
using eshopBL;
using eshopUtilities;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.Navigation
{
    public partial class DesktopNavigation : System.Web.UI.UserControl
    {
        private bool _isHomepage;
        private string _departmentClass;
        private bool _showVerticalMenu;

        public bool IsHomepage
        {
            get { return _isHomepage; }
            set
            {
                this._isHomepage = value;
                this._departmentClass = _isHomepage ? "departments departments--open departments--fixed" : "departments";
                divDepartments.Attributes["class"] = _departmentClass;
            }
        }

        public bool ShowVerticalMenu
        {
            get { return _showVerticalMenu; }
            set { this._showVerticalMenu = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            List<CategoryView> categories = new List<CategoryView>();

            if(Cache["MainMenu"] == null)
            {
                if (File.Exists(Server.MapPath("~/mainMenu.json")))
                    categories = JsonConvert.DeserializeObject<List<CategoryView>>(File.OpenText(Server.MapPath("~/mainMenu.json")).ReadToEnd());
                else
                { 
                    ErrorLog.LogMessage("Desktop navigation create cache");
                    categories = new CategoryViewBL().GetNestedCategoriesList();
                    using (TextWriter tw = new StreamWriter(Server.MapPath("~/mainMenu.json"), false))
                        tw.Write(JsonConvert.SerializeObject(categories));
                }
                Cache.Add("MainMenu", categories, null, DateTime.Now.AddMinutes(60), System.Web.Caching.Cache.NoSlidingExpiration, System.Web.Caching.CacheItemPriority.Normal, null);
            }
            else
            {
                categories = (List<CategoryView>)Cache["MainMenu"];
            }

            if(_showVerticalMenu)
            { 
                //rptMainCategories.DataSource = new CategoryBL().GetNestedCategoriesList();
                rptMainCategories.DataSource = categories;
                rptMainCategories.DataBind();

                divDepartmentsNav.Visible = true;
            }
            else
            {
                HorizontalMenu.Categories = categories;
                HorizontalMenu.Visible = true;
            }
        }
    }
}
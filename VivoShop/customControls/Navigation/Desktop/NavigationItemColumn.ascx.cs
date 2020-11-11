using eshopBE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.Navigation
{
    public partial class NavigationItemColumn : System.Web.UI.UserControl
    {
        private List<Category> _categories;

        public List<Category> Categories
        {
            get { return _categories; }
            set
            {
                _categories = value;
                setValues();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void setValues()
        {
            rptSubCategoriesLevel2.DataSource = _categories;
            rptSubCategoriesLevel2.DataBind();
        }
    }
}
using eshopBE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.Navigation
{
    public partial class NavigationSecondLevelItem : System.Web.UI.UserControl
    {
        private CategoryView _category;

        public CategoryView Category
        {
            get { return _category; }
            set
            {
                _category = value;
                setValues();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void setValues()
        {
            lnkLink.Text = _category.Name;
            lnkLink.NavigateUrl = _category.Url;

            rptSubCategoriesLevel3Col1.DataSource = _category.SubCategories;
            rptSubCategoriesLevel3Col1.DataBind();
        }
    }
}
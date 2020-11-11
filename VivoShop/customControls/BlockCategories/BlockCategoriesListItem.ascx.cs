using eshopBE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.BlockCategories
{
    public partial class BlockCategoriesListItem : System.Web.UI.UserControl
    {
        private Category _category;

        public Category Category
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
            imgCategoryImage.ImageUrl = _category.ImageUrl;
            lblCategoryName.Text = _category.Name;
            rptSubCategories.DataSource = _category.SubCategory;
            rptSubCategories.DataBind();
        }
    }
}
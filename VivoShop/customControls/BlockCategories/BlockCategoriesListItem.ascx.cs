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
            imgCategoryImage.ImageUrl = "/images/" + _category.ImageUrl;
            imgCategoryImage.Visible = _category.ImageUrl != "no-image.jpg";
            lblCategoryName.Text = _category.Name;
            lnkCategory.NavigateUrl = _category.Url;
            lnkShowAll.NavigateUrl = _category.Url;
            lnkImage.NavigateUrl = _category.Url;
            rptSubCategories.DataSource = _category.SubCategories;
            rptSubCategories.DataBind();
        }
    }
}
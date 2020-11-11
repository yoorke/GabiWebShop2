using eshopBE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.Navigation
{
    public partial class NavigationRootItem : System.Web.UI.UserControl
    {
        private Category _category;
        //private List<Category> _column1;
        //private List<Category> _column2;
        //private List<Category> _column3;
        //private List<Category> _column4;
        private List<List<Category>> _subCategories;

        public Category Category
        {
            get { return _category; }
            set {
                _category = value;
                setValues();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void setValues()
        {
            lblCategoryName.Text = _category.Name;
            if(!string.IsNullOrWhiteSpace(_category.ImageUrl))
                divMegenuBody.Attributes["style"] = "background-image: url('" + _category.ImageUrl + "')";

            //_column1 = _column2 = _column3 = _column4 = new List<Category>();
            _subCategories = new List<List<Category>>();
            _subCategories.Add(new List<Category>());
            _subCategories.Add(new List<Category>());
            _subCategories.Add(new List<Category>());
            _subCategories.Add(new List<Category>());
            //_subCategories[0] = new List<Category>();
            //_subCategories[1] = new List<Category>();
            //_subCategories[2] = new List<Category>();
            //_subCategories[3] = new List<Category>();
            int index = 0;

            foreach(Category category in _category.SubCategory ?? new List<Category>())
            {
                //if (_subCategories[index] == null)
                    //_subCategories[index] = new List<Category>();

                _subCategories[index++].Add(category);
                if (index == 4)
                    index = 0;
            }

            //foreach (Category category in _category.SubCategory.Where((x, i) => i % 4 == 0))
            //_column1.Add(category);

            //foreach (Category category in _category.SubCategory.Where((x, i) => i % 3 == 0))
            //_column2.Add(category);

            NICColumn1.Categories = _subCategories[0];
            NICColumn2.Categories = _subCategories[1];
            NICColumn3.Categories = _subCategories[2];
            NICColumn4.Categories = _subCategories[3];
        }
    }
}
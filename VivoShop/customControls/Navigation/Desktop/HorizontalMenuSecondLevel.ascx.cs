using eshopBE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.Navigation.Desktop
{
    public partial class HorizontalMenuSecondLevel : System.Web.UI.UserControl
    {
        private CategoryView _category;
        private List<List<CategoryView>> _subcategories;
        private int index;

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
            _subcategories = new List<List<CategoryView>>();
            _subcategories.Add(new List<CategoryView>());
            _subcategories.Add(new List<CategoryView>());
            _subcategories.Add(new List<CategoryView>());
            _subcategories.Add(new List<CategoryView>());

            foreach(var category in _category.SubCategories ?? new List<CategoryView>())
            {
                _subcategories[index++].Add(category);
                if (index == 4)
                    index = 0;
            }

            SecondLevelColumn1.Categories = _subcategories[0];
            SecondLevelColumn2.Categories = _subcategories[1];
            SecondLevelColumn3.Categories = _subcategories[2];
            SecondLevelColumn4.Categories = _subcategories[3];
        }
    }
}
﻿using eshopBE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.Navigation.Mobile
{
    public partial class NavigationRootItem : System.Web.UI.UserControl
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
            lnkCategory.Text = _category.Name;
            lnkCategory.NavigateUrl = _category.Url;

            rptSubCategoriesLevel2.DataSource = _category.SubCategories;
            rptSubCategoriesLevel2.DataBind();
        }
    }
}
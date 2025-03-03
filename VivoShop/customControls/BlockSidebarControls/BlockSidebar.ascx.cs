using eshopBE;
using eshopBL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.BlockSidebarControls
{
    public partial class BlockSidebar : System.Web.UI.UserControl
    {
        private Category _category;
        private string _categoryUrl;

        public Category Category
        {
            get { return _category; }
            set
            {
                _category = value;
            }
        }

        public string CategoryUrl
        {
            get { return _categoryUrl; }
            set
            {
                _categoryUrl = value;
                setValues();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void setValues()
        {
            loadBrands();
            loadFilter();
        }

        private void loadBrands()
        {
            rptBrands.DataSource = new BrandBL().GetBrands(_categoryUrl, _category.ShowProductsFromSubCategories);
            rptBrands.DataBind();
        }

        private void loadFilter()
        {
            rptFilter.DataSource = new AttributeBL().GetAttributeListForFilter(_categoryUrl);
            rptFilter.DataBind();

            if(((List<eshopBE.Attribute>)rptFilter.DataSource)?.Count > 0)
            {
                spanFilter.Visible = true;
            }
        }
    }
}
using eshopBE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.BlockSidebarControls
{
    public partial class WidgetFiltersBrandsItem : System.Web.UI.UserControl
    {
        private Brand _brand;

        public Brand Brand
        {
            get { return _brand; }
            set
            {
                _brand = value;
                setValues();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void setValues()
        {
            if(_brand != null)
            {
                lblBrandName.Text = _brand.Name;
                lblProductsCount.Text = "";
                brandSpan.Attributes.Add("attributeValue", _brand.BrandID.ToString());
                if (Page.Request.QueryString.ToString().Contains("brands") && Page.Request.QueryString["brands"].Split(',').Contains(_brand.BrandID.ToString()))
                    chkFilterBrands.Attributes["checked"] = "";
            }
        }
    }
}
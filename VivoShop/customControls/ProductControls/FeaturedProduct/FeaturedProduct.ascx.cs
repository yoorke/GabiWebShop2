using eshopBE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.ProductControls.FeaturedProduct
{
    public partial class FeaturedProduct : System.Web.UI.UserControl
    {
        private ProductFPView _product;

        public ProductFPView Product
        {
            get { return _product; }
            set
            {
                _product = value;
                setValues();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void setValues()
        {
            productCard.Product = _product;
        }
    }
}
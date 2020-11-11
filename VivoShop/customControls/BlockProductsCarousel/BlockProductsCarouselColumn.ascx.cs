using eshopBE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.BlockProductsCarousel
{
    public partial class BlockProductCarouselColumn : System.Web.UI.UserControl
    {
        private List<Product> _products;

        public List<Product> Products
        {
            get { return _products; }
            set
            {
                _products = value;
                setValues();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void setValues()
        {
            //productCardControl.Product = _product;
            rptProducts.DataSource = _products;
        }
    }
}
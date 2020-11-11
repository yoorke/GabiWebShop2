using eshopBE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.BlockProducts
{
    public partial class BlockProductsListItem : System.Web.UI.UserControl
    {
        private Product _product;

        public Product Product
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
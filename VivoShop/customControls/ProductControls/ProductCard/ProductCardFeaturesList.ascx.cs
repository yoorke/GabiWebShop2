using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.ProductControls.ProductCard
{
    public partial class ProductCardFeaturesList : System.Web.UI.UserControl
    {
        private int _productID;

        public int ProductID
        {
            get { return _productID; }
            set
            {
                _productID = value;
                setValues();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void setValues()
        {
            //ucitaj attribute values za productID
        }
    }
}
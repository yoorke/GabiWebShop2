using eshopBE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.BlockProductsColumns
{
    public partial class BlockProductsColumnsColumn : System.Web.UI.UserControl
    {
        private string _title;
        private List<Product> _products;

        public string Title
        {
            get { return _title; }
            set { _title = value; }
        }

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
            rptProducts.DataSource = _products;
            rptProducts.DataBind();

            lblTitle.Text = _title;
        }
    }
}
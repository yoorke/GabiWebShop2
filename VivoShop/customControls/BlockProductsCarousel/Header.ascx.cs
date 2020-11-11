using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.BlockProductsCarousel
{
    public partial class Header : System.Web.UI.UserControl
    {
        private string _title;

        public string Title
        {
            get { return _title; }
            set
            {
                _title = value;
                setValues();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void setValues()
        {
            lblTitle.Text = _title;
        }
    }
}
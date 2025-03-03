using eshopBE;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.Navigation
{
    public partial class HorizontalMenu : System.Web.UI.UserControl
    {
        private List<CategoryView> _categories;

        public List<CategoryView> Categories
        {
            get { return _categories; }
            set
            {
                _categories = value;
                setValues();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void setValues()
        {
            rptHorizontalMenu.DataSource = _categories;
            rptHorizontalMenu.DataBind();
        }
    }
}
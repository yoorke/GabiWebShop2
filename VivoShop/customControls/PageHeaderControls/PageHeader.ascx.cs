using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.PageHeaderControls
{
    public partial class PageHeader : System.Web.UI.UserControl
    {
        private string _title;
        private bool _showTitle = true;

        public string Title
        {
            get { return _title; }
            set
            {
                _title = value;
                setValues();
            }
        }

        public bool ShowTitle
        {
            set { _showTitle = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void setValues()
        {
            pageHeaderDiv.Visible = _showTitle;
            lblTitle.Text = _title;
        }
    }
}
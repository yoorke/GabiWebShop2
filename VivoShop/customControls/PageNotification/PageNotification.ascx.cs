using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.PageNotification
{
    public partial class PageNotification : System.Web.UI.UserControl
    {
        public string Message { get; set; }
        public string Type
        {
            get { return _type; }
            set
            {
                _type = value;
            }
        }

        private string _type;

        protected void Page_Load(object sender, EventArgs e)
        {
            //this.Visible = false;
        }

        public void Show()
        {
            this.Visible = true;
            lblNotification.Text = Message;
            lblNotification.Attributes["class"] = "alert alert-" + _type + " d-block";
        }
    }
}
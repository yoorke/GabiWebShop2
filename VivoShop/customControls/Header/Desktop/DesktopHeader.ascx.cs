using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls
{
    public partial class DesktopHeader : System.Web.UI.UserControl
    {
        private bool _isHomepage;

        public bool IsHomepage {
            get { return this._isHomepage; }
            set {
                this._isHomepage = value;
                this.desktopNavigation.IsHomepage = _isHomepage;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls
{
    public partial class HeaderRaw : System.Web.UI.UserControl
    {
        private bool _isHomepage;
        private string _departmentClass;

        public bool IsHomepage {
            get
            {
                return _isHomepage;
            }
            set
            {
                this._isHomepage = value;
                this._departmentClass = _isHomepage ? "departments  departments--open departments--fixed" : "departments";
                divDepartments.Attributes["class"] = _departmentClass;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
    }
}
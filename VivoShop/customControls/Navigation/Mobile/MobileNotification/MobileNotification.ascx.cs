using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.Navigation.Mobile.MobileNotification
{
    public partial class MobileNotification : System.Web.UI.UserControl
    {
        public string Heading {
            set
            {
                lblHeader.Text = value;
            }
        }

        public string ButtonLeftText
        {
            set
            {
                lnkLeft.Text = value;
            }
        }

        public string ButtonLeftLink
        {
            set
            {
                lnkLeft.NavigateUrl = value;
            }
        }

        public string ButtonLeftClass
        {
            set
            {
                lnkLeft.CssClass = value;
            }
        }

        //public string ButtonRightText
        //{
        //    set
        //    {
        //        lnkRight.Text = value;
        //    }
        //}

        //public string ButtonRightLink
        //{
        //    set
        //    {
        //        lnkRight.NavigateUrl = value;
        //    }
        //}

        //public string ButtonRightClass
        //{
        //    set
        //    {
        //        lnkRight.CssClass = value;
        //    }
        //}

        public string Button3Text
        {
            set
            {
                lnkButton3.Text = value;
            }
        }

        public string Button3Link
        {
            set
            {
                lnkButton3.NavigateUrl = value;
            }
        }

        public string Button3CssClass
        {
            set
            {
                lnkButton3.CssClass = value;
            }
        }

        //public string Icon
        //{
        //    set
        //    {
        //        lblIcon.CssClass = value;
        //    }
        //}

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}
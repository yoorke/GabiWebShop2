using eshopBE;
using eshopBL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.BannerControls
{
    public partial class BlockBanner : System.Web.UI.UserControl
    {
        private string _position;

        public string Position
        {
            get { return _position; }
            set
            {
                _position = value;
                setValues();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void setValues()
        {
            BannerItem bannerItem = new BannerBL().GetBanner(_position);
            if (bannerItem != null)
            {
                lnkBanner.NavigateUrl = bannerItem.Url;

                divDesktop.Attributes["style"] = "background-image: url('" + bannerItem.ImageUrl + "')";
                divMobile.Attributes["style"] = "background-image: url('" + bannerItem.ImageUrl + "')";

                lblTitle.Text = bannerItem.Title;
                lblText.Text = bannerItem.Text;
                lblButtonText.Text = bannerItem.ButtonText;
            }
        }
    }
}
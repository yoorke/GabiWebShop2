using eshopBE;
using eshopBL;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
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
            BannerItem bannerItem = new BannerItem();

            if(Cache[ID] == null)
            {
                if (File.Exists(Server.MapPath("~/banner" + ID + ".json")))
                    bannerItem = JsonConvert.DeserializeObject<BannerItem>(File.OpenText(Server.MapPath("~/banner" + ID + ".json")).ReadToEnd());
                else
                { 
                    bannerItem = new BannerBL().GetBanner(_position);
                    using (TextWriter tw = new StreamWriter(Server.MapPath("banner" + ID + ".json"), false))
                        tw.Write(JsonConvert.SerializeObject(bannerItem));
                }
                Cache.Add(ID, bannerItem, null, DateTime.Now.AddMinutes(60), System.Web.Caching.Cache.NoSlidingExpiration, System.Web.Caching.CacheItemPriority.Normal, null);
            }
            else
            {
                bannerItem = (BannerItem)Cache[ID];
            }

            //BannerItem bannerItem = new BannerBL().GetBanner(_position);
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
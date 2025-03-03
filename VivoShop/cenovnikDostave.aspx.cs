using eshopBE;
using eshopBL;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop
{
    public partial class cenovnikDostave : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                loadPrices();
                loadSettings();
            }
        }

        private void loadPrices()
        {
            DataTable prices = new DeliveryServiceBL().GetDeliveryPrices(3);
            rptDeliveryPrices.DataSource = prices;
            rptDeliveryPrices.DataBind();
        }

        private void loadSettings()
        {
            Settings settings = new Settings();
            if(Cache["settings"] == null)
            {
                if (File.Exists(Server.MapPath("~/settings.json")))
                    settings = JsonConvert.DeserializeObject<Settings>(File.OpenText(Server.MapPath("~/settings.json")).ReadToEnd());
                else
                {
                    settings = new SettingsBL().GetSettings();
                }
                Cache.Add("settings", settings, null, DateTime.Now.AddMinutes(200), System.Web.Caching.Cache.NoSlidingExpiration, System.Web.Caching.CacheItemPriority.Normal, null);
            }
            settings = (Settings)Cache["settings"];

            lblFreeDeliveryTotalValue.Text = string.Format("{0:N2}", settings.FreeDeliveryTotalValue);
            //Settings settings = new SettingsBL().GetSettings();
        }
    }
}
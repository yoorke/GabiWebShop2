using eshopBE;
using eshopBL;
using eshopUtilities;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.BlockFeatures
{
    public partial class BlockedFeatures : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                setValues();
        }

        private void setValues()
        {
            Settings settings = new Settings();

            if(Cache["settings"] == null)
            {
                if (File.Exists(Server.MapPath("~/settings.json")))
                    settings = JsonConvert.DeserializeObject<Settings>(File.OpenText(Server.MapPath("~/settings.json")).ReadToEnd());
                else
                {
                    ErrorLog.LogMessage("Settings create cache");
                    settings = new SettingsBL().GetSettings();
                    using (TextWriter tw = new StreamWriter(Server.MapPath("~/settings.json"), false))
                        tw.Write(JsonConvert.SerializeObject(settings));
                    //Settings settings = new SettingsBL().GetSettings();
                }

                Cache.Add("settings", settings, null, DateTime.Now.AddMinutes(200), System.Web.Caching.Cache.NoSlidingExpiration, System.Web.Caching.CacheItemPriority.Normal, null);
            }

            settings = (Settings)Cache["settings"];
            lblFreeDeliveryTotalValue.Text = string.Format("{0:N2}", settings.FreeDeliveryTotalValue);
        }
    }
}
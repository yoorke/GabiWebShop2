using eshopBL;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.Slider
{
    public partial class Slider : System.Web.UI.UserControl
    {
        private int _sliderID;
        private bool _showVerticalMenu;

        public int SliderID
        {
            get { return _sliderID; }
            set
            {
                _sliderID = value;
                setValues();
            }
        }

        public bool ShowVerticalMenu
        {
            get { return _showVerticalMenu; }
            set { _showVerticalMenu = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!_showVerticalMenu)
            {
                divOffset.Visible = false;
                divSlider.Attributes["class"] = "col-12";
            }
        }

        private void setValues()
        {
            List<eshopBE.SliderItem> sliderItems = new List<eshopBE.SliderItem>();

            if(Cache["Slider"] == null)
            {
                if (File.Exists(Server.MapPath("~/slider.json")))
                    sliderItems = JsonConvert.DeserializeObject<List<eshopBE.SliderItem>>(File.OpenText(Server.MapPath("~/slider.json")).ReadToEnd());
                else
                {
                    sliderItems = new SliderBL().GetSliderItems(_sliderID);
                    using (TextWriter tw = new StreamWriter(Server.MapPath("~/slider.json"), false))
                        tw.Write(JsonConvert.SerializeObject(sliderItems));
                }
                Cache.Add("Slider", sliderItems, null, DateTime.Now.AddMinutes(60), System.Web.Caching.Cache.NoSlidingExpiration, System.Web.Caching.CacheItemPriority.Normal, null);
            }
            else
            {
                sliderItems = (List<eshopBE.SliderItem>)Cache["Slider"];
            }

            //rptSlider.DataSource = new SliderBL().GetSliderItems(_sliderID);
            rptSlider.DataSource = sliderItems;
            rptSlider.DataBind();
        }
    }
}
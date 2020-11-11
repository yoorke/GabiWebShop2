using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eshopBE;

namespace VivoShop.customControls.Slider
{
    public partial class SliderItem : System.Web.UI.UserControl
    {
        private eshopBE.SliderItem _sliderItem;

        public eshopBE.SliderItem Item
        {
            get { return _sliderItem; }
            set
            {
                _sliderItem = value;
                setValues();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void setValues()
        {
            string imageExtenstion = _sliderItem.ImageUrl.Substring(_sliderItem.ImageUrl.LastIndexOf('.'));
            string imageName = _sliderItem.ImageUrl.Substring(0, _sliderItem.ImageUrl.IndexOf(imageExtenstion));
            divDesktop.Attributes["style"] = "background-image: url('" + imageName + imageExtenstion + "')";
            divMobile.Attributes["style"] = "background-image: url('" + imageName + "-mobile" + imageExtenstion + "')";

            txtTitle.Text = _sliderItem.Title;
            txtText.Text = _sliderItem.Description;
            //txtTextWhite.Text = "Description 2";

            txtButtonText.Text = _sliderItem.ButtonText;

            lnkSlider.NavigateUrl = _sliderItem.Url;
        }
    }
}
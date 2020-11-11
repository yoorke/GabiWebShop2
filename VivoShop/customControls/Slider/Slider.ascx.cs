using eshopBL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.Slider
{
    public partial class Slider : System.Web.UI.UserControl
    {
        private int _sliderID;

        public int SliderID
        {
            get { return _sliderID; }
            set
            {
                _sliderID = value;
                setValues();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        private void setValues()
        {
            rptSlider.DataSource = new SliderBL().GetSliderItems(_sliderID);
            rptSlider.DataBind();
        }
    }
}
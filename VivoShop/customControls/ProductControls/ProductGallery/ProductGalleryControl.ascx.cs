using eshopBE;
using eshopBL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.ProductControls.ProductGallery
{
    public partial class ProductGalleryControl : System.Web.UI.UserControl
    {
        private List<ProductImage> _images;

        public List<ProductImage> Images
        {
            get { return _images; }
            set
            {
                _images = value;
                setImages();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void setImages()
        {
            rptImages.DataSource = _images;
            rptImages.DataBind();

            rptImagesCarousel.DataSource = _images;
            rptImagesCarousel.DataBind();
        }

        protected void rptImages_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            setImages(e, ConfigurationManager.AppSettings["mainName"]);
        }

        protected void rptImagesCarousel_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            setImages(e, ConfigurationManager.AppSettings["thumbName"]);
        }

        private void setImages(RepeaterItemEventArgs e, string type)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HyperLink lnkProductImage = (HyperLink)e.Item.FindControl("lnkProductImage");
                string imageUrl = lnkProductImage.NavigateUrl;
                //lnkProductImage.NavigateUrl = getDirectory(getFilename(imageUrl)) + getFilename(imageUrl) + getExtension(imageUrl);
                lnkProductImage.NavigateUrl = new ProductBL().GetFullImageUrl(imageUrl, string.Empty);

                Image imgProductImage = (Image)e.Item.FindControl("imgProductImage");
                //imgProductImage.ImageUrl = getDirectory(getFilename(imageUrl)) + getFilename(imageUrl) + getExtension(imageUrl);
                imgProductImage.ImageUrl = new ProductBL().GetFullImageUrl(imageUrl, type);
            }
        }

        //private string getDirectory(string filename)
        //{
            //return new ProductBL().CreateImageDirectory(int.Parse(filename));
        //}

        //private string getFilename(string imageUrl)
        //{
            //return imageUrl.Substring(0, imageUrl.LastIndexOf('.'));
        //}

        //private string getExtension(string imageUrl)
        //{
            //return imageUrl.Substring(imageUrl.LastIndexOf('.'));
        //}
    }
}
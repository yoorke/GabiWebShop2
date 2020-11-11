using eshopBE;
using eshopBL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop
{
    public partial class product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                loadProduct(Page.RouteData.Values["product"] != null ? Page.RouteData.Values["product"].ToString() : string.Empty);
            }
        }

        private void loadProduct(string productName)
        {
            int productID = getProductID(productName);
            if(productID > 0)
            {
                Product product = new ProductBL().GetProduct(productID, string.Empty, true, string.Empty);

                if(product != null)
                {
                    productGallery.Images = product.Images;
                    lblProductName.Text = product.Brand.Name + " " + product.Name;
                    lblProductDescription.Text = product.Description;
                    lblBrandName.Text = product.Brand.Name;
                    lblProductCode.Text = product.Code;
                    lblProductWebPrice.Text = string.Format("{0:N2}", product.WebPrice);
                    lblProductDescriptionBottom.Text = product.Description;
                    lblProductSpecification.Text = product.Specification;

                    productCarousel.CategoryID = product.Categories[0].CategoryID;

                    btnCart.Attributes.Add("onclick", "AddToCart('" + product.ProductID + "', event); return false;");
                }
            }
        }

        private int getProductID(string productName)
        {
            StringBuilder sb = new StringBuilder();
            for (int i = productName.Length - 1; i > 0; i--)
                if (productName[i] == '-')
                    break;
                else
                    if (char.IsDigit(productName[i]))
                    sb.Insert(0, productName[i]);

            int productID = -1;
            int.TryParse(sb.ToString(), out productID);
            return productID;
        }
    }
}
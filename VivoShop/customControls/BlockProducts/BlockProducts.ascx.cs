using eshopBE;
using eshopBL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.BlockProducts
{
    public partial class BlockProducts : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                loadProducts();
            }
        }

        private void loadProducts()
        {
            List<Product> products = new ProductBL().GetProductsForFirstPage(-1, -1, 7, "product.Name");

            if (products != null)
            {
                featuredProduct.Product = products[0];

                products.RemoveAt(0);

                rptFeaturedProducts.DataSource = products;
                rptFeaturedProducts.DataBind();
            }
        }
    }
}
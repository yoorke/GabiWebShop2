using eshopBL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.BlockProductsColumns
{
    public partial class BlockProductsColumns : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadProducts();
        }

        private void loadProducts()
        {
            column1.Title = "Najprodavanije";
            column2.Title = "Specijalna ponuda";
            column3.Title = "Najpopularnije";

            column1.Products = new ProductBL().GetProductsForFirstPage(-1, -1, 3, "product.name");
            column2.Products = new ProductBL().GetProductsForFirstPage(-1, -1, 3, "product.name");
            column3.Products = new ProductBL().GetProductsForFirstPage(-1, -1, 3, "product.name");

            
        }
    }
}
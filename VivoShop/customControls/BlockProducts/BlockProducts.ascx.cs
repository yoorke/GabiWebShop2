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
        private ProductOrderByType _orderByType = ProductOrderByType.Random;
        private int _numberOfProducts;
        private int _name = new Random().Next(1000, 10000);

        public ProductOrderByType OrderByType
        {
            get { return _orderByType; }
            set
            {
                _orderByType = value;
                loadProducts();
            }
        }

        public int NumberOfProducts
        {
            get { return _numberOfProducts; }
            set
            {
                _numberOfProducts = value;
                //loadProducts();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //loadProducts();
            }
        }

        private void loadProducts()
        {
            List<ProductFPView> products = new List<ProductFPView>();
            //if (Cache["BlockProducts" + _name] != null)
            //products = (List<ProductFPView>)Cache["BlockProducts" + _name];
            if (Cache[ID] != null)
                //products = new List<ProductFPView>((List<ProductFPView>)Cache[ID]);
                products = (List<ProductFPView>)Cache[ID];
            else
            {
                products = new ProductViewBL().GetProductsForFirstPage(-1, -1, _numberOfProducts, _orderByType);
                //Cache["BlockProducts" + _name] = products;
                //Cache.Add("BlockProducts" + _name, products, null, DateTime.Now.AddMinutes(60), System.Web.Caching.Cache.NoSlidingExpiration, System.Web.Caching.CacheItemPriority.Normal, null);
                //Cache.Add(ID, new List<ProductFPView>(products), null, DateTime.Now.AddMinutes(60), System.Web.Caching.Cache.NoSlidingExpiration, System.Web.Caching.CacheItemPriority.Normal, null);
                Cache.Add(ID, products, null, DateTime.Now.AddMinutes(60), System.Web.Caching.Cache.NoSlidingExpiration, System.Web.Caching.CacheItemPriority.Normal, null);
            }

            //List<Product> products = new ProductBL().GetProductsForFirstPage(-1, -1, 7, "Slučajni");
            //List<ProductFPView> products = new ProductViewBL().GetProductsForFirstPage(-1, -1, _numberOfProducts, _orderByType);

            if (products != null)
            {
                featuredProduct.Product = products[0];

                List<ProductFPView> featuredProducts = new List<ProductFPView>(products);
                featuredProducts.RemoveAt(0);

                rptFeaturedProducts.DataSource = featuredProducts;
                rptFeaturedProducts.DataBind();

                featuredProducts = null;
            }
        }
    }
}
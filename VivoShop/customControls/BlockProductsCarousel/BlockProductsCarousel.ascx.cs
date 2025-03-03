using eshopBE;
using eshopBL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.BlockProductsCarousel
{
    public partial class BlockProductsCarousel : System.Web.UI.UserControl
    {
        private BlockProductsCarouselType _type;
        private string _title;
        private int _categoryID = -1;
        private string _orderBy = "Slučajni";
        private ProductOrderByType _orderByType = ProductOrderByType.Random;
        private int _numberOfProducts = 16;
        private bool _cacheData = true;

        public BlockProductsCarouselType Type
        {
            get { return _type; }
            set
            {
                _type = value;
                //loadProducts();
                //setValues();
            }
        }

        public string Title
        {
            get { return _title; }
            set
            {
                _title = value;
                //setValues();
            }
        }

        public int CategoryID
        {
            set { _categoryID = value; }
        }

        public string OrderBy
        {
            set { _orderBy = value; }
        }

        public ProductOrderByType OrderByType
        {
            set { _orderByType = value; }
        }

        public int NumberOfProducts
        {
            set { _numberOfProducts = value; }
        }

        public bool CacheData
        {
            get { return _cacheData; }
            set { _cacheData = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //rptProducts.DataSource = new ProductBL().GetProductsForFirstPage(-1, -1, 16, "product.name");
            //rptProducts.DataBind();
        }

        private void loadProducts()
        {
            List<ProductFPView> products = new List<ProductFPView>();

            if(Cache[ID] == null || !_cacheData)
            { 
                //List<Product> products = new ProductBL().GetProductsForFirstPage(_categoryID, -1, 16, "Slučajni");
                products = new ProductViewBL().GetProductsForFirstPage(_categoryID, -1, _numberOfProducts, _orderByType);
                if(_cacheData && products != null)
                    Cache.Add(ID, products, null, DateTime.Now.AddMinutes(60), System.Web.Caching.Cache.NoSlidingExpiration, System.Web.Caching.CacheItemPriority.Normal, null);
            }
            else
            {
                products = (List<ProductFPView>)Cache[ID];
            }

            List<List<ProductFPView>> carouselProducts = new List<List<ProductFPView>>();
            int index = (int)_type;
            int listIndex = 0;

            if (products != null)
            {
                for (int i = 0; i < products.Count; i++)
                {
                    if (carouselProducts.Count <= listIndex)
                        carouselProducts.Add(new List<ProductFPView>());
                    //carouselProducts[listIndex] = new List<Product>();

                    carouselProducts[listIndex].Add(products[i]);

                    if ((i + 1) % index == 0)
                        listIndex++;

                }
            }

            //if (_type == BlockProductsCarouselType.Grid4) {

            rptProducts.DataSource = carouselProducts;
            rptProducts.DataBind();
            //}
        }

        private void setValues()
        {
            divBlockProductsCarousel.Attributes["data-layout"] = getTypeAttributeValue(_type);//_type.ToString().ToLower();
            header.Title = _title;
        }

        private string getTypeAttributeValue(BlockProductsCarouselType type)
        {
            StringBuilder value = new StringBuilder();
            foreach (char c in type.ToString())
            {
                if (char.IsNumber(c))
                    value.Append('-');
                value.Append(c);

            }
            return value.ToString().ToLower();
        }

        public void LoadProducts()
        {
            setValues();
            loadProducts();
        }
    }
}
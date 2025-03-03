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

            List<ProductFPView> productsByOrder = new List<ProductFPView>();
            List<ProductFPView> productsByRandom = new List<ProductFPView>();
            List<ProductFPView> productsByAccess = new List<ProductFPView>();

            if(Cache["productsByOrder"] == null)
            {
                if (File.Exists(Server.MapPath("~/productsByOrder.json")))
                    productsByOrder = JsonConvert.DeserializeObject<List<ProductFPView>>(File.OpenText(Server.MapPath("~/productsByOrder.json")).ReadToEnd());
                else
                {
                    ErrorLog.LogMessage("Products by order create cache");
                    productsByOrder = new ProductViewBL().GetProductsForFirstPage(-1, -1, 3, ProductOrderByType.Order);
                    using (TextWriter tw = new StreamWriter(Server.MapPath("~/productsByOrder.json"), false))
                        tw.Write(JsonConvert.SerializeObject(productsByOrder));
                }

                Cache.Add("productsByOrder", productsByOrder, null, DateTime.Now.AddMinutes(200), System.Web.Caching.Cache.NoSlidingExpiration, System.Web.Caching.CacheItemPriority.Normal, null);
            }

            column1.Products = (List<ProductFPView>)Cache["productsByOrder"];

            if(Cache["productsByRandom"] == null)
            {
                if (File.Exists(Server.MapPath("~/productsByRandom.json")))
                    productsByRandom = JsonConvert.DeserializeObject<List<ProductFPView>>(File.OpenText(Server.MapPath("~/productsByRandom.json")).ReadToEnd());
                else
                {
                    ErrorLog.LogMessage("Products by random create cache");
                    productsByRandom = new ProductViewBL().GetProductsForFirstPage(-1, -1, 3, ProductOrderByType.Random);
                    using (TextWriter tw = new StreamWriter(Server.MapPath("~/productsByRandom.json"), false))
                        tw.Write(JsonConvert.SerializeObject(productsByRandom));
                }

                Cache.Add("productsByRandom", productsByRandom, null, DateTime.Now.AddMinutes(200), System.Web.Caching.Cache.NoSlidingExpiration, System.Web.Caching.CacheItemPriority.Normal, null);
            }

            column2.Products = (List<ProductFPView>)Cache["productsByRandom"];

            if(Cache["productsByAccess"] == null)
            {
                if (File.Exists(Server.MapPath("~/productsByAccess.json")))
                    productsByAccess = JsonConvert.DeserializeObject<List<ProductFPView>>(File.OpenText(Server.MapPath("~/productsByAccess.json")).ReadToEnd());
                else
                {
                    ErrorLog.LogMessage("Products by access create cache");
                    productsByAccess = new ProductViewBL().GetProductsForFirstPage(-1, -1, 3, ProductOrderByType.Access);
                    using (TextWriter tw = new StreamWriter(Server.MapPath("~/productsByAccess.json"), false))
                        tw.Write(JsonConvert.SerializeObject(productsByAccess));
                }

                Cache.Add("productsByAccess", productsByAccess, null, DateTime.Now.AddMinutes(200), System.Web.Caching.Cache.NoSlidingExpiration, System.Web.Caching.CacheItemPriority.Normal, null);
            }

            column3.Products = (List<ProductFPView>)Cache["productsByAccess"];

            //column1.Products = new ProductBL().GetProductsForFirstPage(-1, -1, 3, "Slučajni");
            //column1.Products = new ProductViewBL().GetProductsForFirstPage(-1, -1, 3, ProductOrderByType.Order);
            //column2.Products = new ProductBL().GetProductsForFirstPage(-1, -1, 3, "Slučajni");
            //column2.Products = new ProductViewBL().GetProductsForFirstPage(-1, -1, 3, ProductOrderByType.Random);
            //column3.Products = new ProductBL().GetProductsForFirstPage(-1, -1, 3, "Slučajni");
            //column3.Products = new ProductViewBL().GetProductsForFirstPage(-1, -1, 3, ProductOrderByType.Access);

            
        }
    }
}
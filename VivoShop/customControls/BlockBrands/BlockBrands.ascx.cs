using eshopBE;
using eshopBL;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.BlockBrands
{
    public partial class BlockBrands : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
                loadBrands();
        }

        private void loadBrands()
        {
            List<Brand> brands = new List<Brand>();

            if(Cache["BlockBrands"] == null)
            {
                if (File.Exists(Server.MapPath("~/blockBrands.json")))
                    brands = JsonConvert.DeserializeObject<List<Brand>>(File.OpenText(Server.MapPath("~/blockBrands.json")).ReadToEnd());
                else
                {
                    brands = new BrandBL().GetBrands(false);
                    using (TextWriter tw = new StreamWriter(Server.MapPath("~/blockBrands.json"), false))
                        tw.Write(JsonConvert.SerializeObject(brands));
                }
                Cache.Add("BlockBrands", brands, null, DateTime.Now.AddMinutes(60), System.Web.Caching.Cache.NoSlidingExpiration, System.Web.Caching.CacheItemPriority.Normal, null);
            }
            else
            {
                brands = (List<Brand>)Cache["BlockBrands"];
            }

            //rptBrands.DataSource = new BrandBL().GetBrands(false);
            rptBrands.DataSource = brands;
            rptBrands.DataBind();
        }
    }
}
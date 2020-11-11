using eshopBL;
using System;
using System.Collections.Generic;
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
            rptBrands.DataSource = new BrandBL().GetBrands(false);
            rptBrands.DataBind();
        }
    }
}
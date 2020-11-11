using eshopBL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.Footer
{
    public partial class FooterControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                setValues();
        }

        private void setValues()
        {
            lblCompanyDescription.Text = "Gabi boje nudi širok spektar proizvoda, od proizvoda namenjenih farbanju i lakiranju, preko alata do šrafovske robe." +
                " Kontaktirajte nas i saznajte više o proizvodima il nam postavite pitanje. Naši stručnjaci spremni su da uvek izađu u susret.";

            lblAddress.Text = "Hunjadi Janoša 33, 23000 Zrenjanin";
            lblEmail.Text = "info@gabi-boje.rs";
            lblPhone.Text = "+381 (0) 23 527 184";
            lblWorkingHours.Text = "Pon - Sub 08:00 - 19:00";

            rptPagesFooterLinks.DataSource = new CustomPageBL().GetCustomPagesForCustomPageCategory(5);
            rptPagesFooterLinks.DataBind();

            rptPagesFooterLinks2.DataSource = new CustomPageBL().GetCustomPagesForCustomPageCategory(6);
            rptPagesFooterLinks2.DataBind();
        }
    }
}
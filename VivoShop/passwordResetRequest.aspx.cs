using eshopBL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop
{
    public partial class passwordResetRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtEmail.Focus();
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            if(!string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                if (new UserBL().CreatePasswordResetToken(txtEmail.Text))
                    Server.Transfer("/passwordResetMailSent.aspx");
                else
                {
                    pageNotification.Message = "Ne postoji korisnički nalog za uneti email adresu";
                    pageNotification.Type = "warning";
                    pageNotification.Show();
                }
            }
        }
    }
}
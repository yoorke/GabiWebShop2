using eshopBL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop.account
{
    public partial class passwordChange : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)
                Response.Redirect("/prijava?returnUrl=" + Page.Request.RawUrl);
            txtPassword.Focus();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if(checkValues())
                {
                    string status = new UserBL().ChangePassword(User.Identity.Name, txtPassword.Text, txtNewPassword.Text);
                }
                else
                {
                    //set status
                    setStatus("Unesite staru šifru, novu šifru i ponovite unos nove šifre. Nova šifra mora da ima bar 6 karaktera.", "warning");
                }
            }
            catch(Exception ex)
            {
                //set status
                setStatus("Greška prilikom unosa nove šifre", "danger");
            }
        }

        private bool checkValues()
        {
            return txtPassword.Text.Length > 0 && txtNewPassword.Text.Length > 6 && txtNewPasswordConfirmed.Text.Length > 6
                && txtNewPassword.Text.Equals(txtNewPasswordConfirmed.Text);
        }

        private void setStatus(string message, string type)
        {
            statusBox.Visible = true;
            lblStatus.Text = message;
            statusBox.Attributes["class"] += " alert-" + type;
        }
    }
}
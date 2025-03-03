using eshopBE;
using eshopBL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop
{
    public partial class passwordReset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                if(Page.Request.QueryString.ToString().Contains("id"))
                {
                    string token = Page.Request.QueryString["id"];
                    if (validToken(token))
                        txtPassword.Focus();
                    else
                    {
                        pageNotification.Message = "Korisnik za kojeg ste zahtevali resetovanje šifre ne postoji ili je period za reset šifre istekao.";
                        pageNotification.Type = "warning";
                        pageNotification.Show();
                    }
                }
            }
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(lblUserID.Value)
                && txtPassword.Text == txtPasswordConfirm.Text
                && txtPassword.Text.Length >= 6)
            {
                if (new UserBL().ChangePassword(int.Parse(lblUserID.Value), txtPassword.Text))
                    Server.Transfer("/passwordChanged.aspx");
            }
            else if (txtPassword.Text != txtPasswordConfirm.Text)
            { 
                pageNotification.Message = "Uneta šifra se ne poklapa sa ponovljenom šifrom.";
                pageNotification.Type = "warning";
                pageNotification.Show();
            }
        }

        private bool validToken(string token)
        {
            User user = new UserBL().GetUserFromToken(token);
            if(user != null)
            {
                lblUsername.Text = user.Username;
                lblUserID.Value = user.UserID.ToString();
                return true;
            }

            return false;
        }
    }
}
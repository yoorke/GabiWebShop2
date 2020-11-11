using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using eshopUtilities;

namespace VivoShop
{
    public partial class kontakt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                if(txtEmail.Text.Trim().Equals(string.Empty) || txtName.Text.Trim().Equals(string.Empty) || txtSubject.Text.Trim().Equals(string.Empty) || txtMessage.Text.Trim().Equals(string.Empty))
                {
                    setStatus("Unesite sva obavezna polja kako bi poruka mogla da bude poslata. Obavezna polja: Email, Vaš ime, Naslov i Poruka", "alert-warning");
                    return;
                }

                Common.SendMessage(txtEmail.Text, "Poruka sa sajta - " + ConfigurationManager.AppSettings["companyName"] + " - " + txtSubject.Text, "Poruka od: " + txtEmail.Text + "<br/><br/>" + txtMessage.Text);
                setStatus("Poruka uspešno poslata", "alert-success");
            }
            catch(Exception ex)
            {
                ErrorLog.LogError(ex);
                setStatus("Poruka nije poslata, došlo je do greške.", "alert-danger");
            }
        }

        private void setStatus(string message, string classes)
        {
            lblStatus.Visible = true;
            divStatus.Visible = true;
            lblStatus.Text = message;
            divStatus.Attributes["class"] = "mt-4 text-center alert " + classes;
        }
    }
}
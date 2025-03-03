using eshop.PaymentProcessor.BE;
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
    public partial class notificationTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Order order = new OrderBL().GetOrder(17202);
            PaymentResponse paymentReponse = new PaymentResponse()
            {
                Amount = "123.45",
                AuthCode = "AuthCode",
                Date = DateTime.Now,
                Md = "Md",
                OrderID = 17195,
                ProcReturnCode = "ProcReturnCode",
                Response = "Response"
            };

            Settings settings = new SettingsBL().GetSettings();

            //new NotificationHandler().SendSuccessPaymentResponse(order, settings, paymentReponse);
            new NotificationHandler().SendFailPaymentResponse(order, settings, paymentReponse);
        }
    }
}
using eshop.PaymentProcessor.BE;
using eshop.PaymentProcessor.BL;
using eshopBE;
using eshopBL;
using eshopUtilities;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Hosting;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VivoShop
{
    public partial class paymentResponse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            checkResponse();

            bool isDebug = false;

            if(isDebug)
            {
                divResponse.Visible = isDebug;
                lblIconSucess.Visible = isDebug;
                lblResponseHeader.Text = this.getResponseHeader("Approved");
                setDivColor("Approved");
                lblMessage.Text = getMessage("Approved", "165");
            }
        }

        private void checkResponse()
        {
            string message = string.Empty;
            bool isValid = true;
            Order order = new Order();
            PaymentResponse paymentResponse = new PaymentResponse();
            Settings settings = new SettingsBL().GetSettings();

            try
            {
                if (!checkMandatoryFields())
                {
                    message = setMessage(message, "Security alert. Mandatory fields missing.", false);
                    isValid = false;
                    //box.Attributes.Add("class", "box box-danger");
                    //boxHeader.Attributes.Add("class", "border p-1 text-center text-white mb-5 mt-2 bg-danger");
                    setDivColor("Error");

                    //return;
                }

                if (!checkClientID())
                {
                    message = setMessage(message, "Security alert. Incorent client ID", false);
                    isValid = false;
                    //box.Attributes.Add("class", "box box-danger");
                    //boxHeader.Attributes.Add("class", "border p-1 text-center text-white mb-5 mt-2 bg-danger");
                    setDivColor("Error");

                    //return;
                }

                if (!checkHash())
                {
                    message = setMessage(message, "Security alert. Incorect hash", false);
                    isValid = false;
                    //box.Attributes.Add("class", "box box-danger");
                    //boxHeader.Attributes.Add("class", "border p-1 text-center text-white mb-5 mt-2 bg-danger");
                    setDivColor("Error");

                    //return;
                }

                if(!isValid)
                {
                    lblResponseHeader.Text = getResponseHeader("Error");
                    //lblMessage.Text = getMessage("Error", "0") + "<br>" + message;

                    message = getMessage("Error", "0") + "<br>" + message;
                }

                int oid = getOrderCodeFromResponse();
                if(oid != -1)
                {
                    order = new OrderBL().GetOrder(-1, oid);
                }

                if (isValid)
                {
                    paymentResponse = GetPaymentResponse();
                    order = new OrderBL().GetOrder(-1, getOrderCodeNumber(paymentResponse.Oid));

                    lblAuthCode.Text = paymentResponse.AuthCode;
                    lblTransactionID.Text = paymentResponse.TransId;
                    lblResponse.Text = paymentResponse.Response;
                    lblProcReturnCode.Text = paymentResponse.ProcReturnCode;
                    lblTransactionDate.Text = paymentResponse.Date.ToString("dd.MM.yyyy HH:mm");
                    lblMdStatus.Text = paymentResponse.Md;
                    lblErrorMessage.Text = paymentResponse.ErrMsg;


                    if (paymentResponse.Response.Equals("Approved"))
                    {
                        //box.Attributes.Add("class", "box box-success");
                        lblIconSucess.Visible = true;
                        //boxHeader.Attributes.Add("class", "border p-1 text-center text-white mb-5 mt-2 bg-success");
                        setDivColor("Approved");
                    }
                    else if (paymentResponse.Response.Equals("Declined") || paymentResponse.Response.Equals("Error"))
                    {
                        //box.Attributes.Add("class", "box box-danger");
                        lblIconDanger.Visible = true;
                        //boxHeader.Attributes.Add("class", "border p-1 text-center text-white mb-5 mt-2 bg-danger");
                        setDivColor("Error");
                    }

                    divResponse.Visible = true;

                    lblResponseHeader.Text = getResponseHeader(paymentResponse.Response);
                    message = getMessage(paymentResponse.Response, paymentResponse.Amount);

                    lblUsername.Text = order.Email;
                    lblName.Text = order.Firstname + " " + order.Lastname + " " + order.Name;
                    lblOrderID.Text = paymentResponse.Oid;

                    paymentResponse.OrderID = order.OrderID;
                    new PaymentResponseBL().SavePaymentResponse(paymentResponse);

                    if (paymentResponse.Response.Equals("Approved"))
                    {
                        order.IsPaid = true;

                        //dodaj
                        //new OrderBL().SetPaid(order.ID, order.Paid);
                        //License license = new WebAppBL().UpdateUserLicense(order.SoftwareID, order.Username, new PeriodBL().GetByID(order.PeriodID).Value);
                        //new OrderBL().UpdateOrderStatus(order.OrderID, new OrderStatus(6, string.Empty, false, false), order.Email, order.Code, order.Firstname + " " + order.Lastname, order.Date.ToString("dd.MM.yyyy"), null, string.Empty);
                        new OrderBL().UpdateOrderPaymentStatus(order.OrderID, "PPK");
                        new OrderBL().UpdateConfirmed(order.OrderID, true);

                        new CartBL().ClearItems(Session["cartID"].ToString());
                        new CartBL().RemoveCoupon(Session["cartID"].ToString());
                        
                        if(Session["orderID"] != null)
                        {
                            Session.Remove("orderID");
                        }
                        

                        new NotificationHandler().SendSuccessPaymentResponse(order, settings, paymentResponse);

                        try
                        {
                            HostingEnvironment.QueueBackgroundWorkItem(bw =>
                            {
                                Common.SendOrderConfirmationMail(order.Email, order.Firstname + " " + order.Lastname, order, settings);
                                Common.SendNewOrderNotification(order.OrderID.ToString(), order, settings);
                            });
                        }
                        catch (Exception ex)
                        {
                            ErrorLog.LogError(ex);
                        }
                    }
                    else
                    {
                        new NotificationHandler().SendFailPaymentResponse(order, settings, paymentResponse);
                    }

                    //dodaj
                }

                lblMessage.Text = message;


                if (!isValid)
                {
                    new NotificationHandler().SendFailPaymentResponse(order, settings, paymentResponse);
                }
                else
                {

                }
            }
            catch(Exception ex)
            {
                ErrorLog.LogError(ex);
            }
        }

        private bool checkMandatoryFields()
        {
            string[] mandatoryFields = new string[] { "clientid", "oid", "Response" };

            foreach (string field in mandatoryFields)
                if (Request.Form[field] == null || Request.Form[field] == "")
                    return false;
            return true;
        }

        private bool checkClientID()
        {
            if (Request.Form == null || string.IsNullOrEmpty(Request.Form.Get("clientid")) || !Request.Form.Get("clientid").Equals(ConfigurationManager.AppSettings["PPMerchantID"]))
                return false;
            return true;
        }

        private bool checkHash()
        {
            string hashParams = Request.Form["HASHPARAMS"];
            string hashParamsVal = Request.Form["HASHPARAMSVAL"];
            string hash = string.Empty;
            string storeKey = ConfigurationManager.AppSettings["PPStoreKey"];

            string paramsVal = string.Empty;
            string hashVal = string.Empty;

            if(string.IsNullOrEmpty(hashParams))
            {
                return false;
            }

            string[] parsedParams = hashParams.Split('|');
            foreach (string parsedParam in parsedParams)
            {
                string val = Request.Form.Get(parsedParam) == null ? string.Empty : Request.Form.Get(parsedParam);
                paramsVal += val.Replace("\\", "\\\\").Replace("|", "\\|") + "|";
            }
            paramsVal = paramsVal.Substring(0, paramsVal.Length - 1);
            hashVal = paramsVal + "|" + storeKey.Replace("\\", "\\\\").Replace("|", "\\|");
            string hashParam = Request.Form.Get("HASH");

            SHA512 sha = new SHA512CryptoServiceProvider();
            byte[] hashBytes = Encoding.GetEncoding("utf-8").GetBytes(hashVal);
            byte[] inputBytes = sha.ComputeHash(hashBytes);
            hash = Convert.ToBase64String(inputBytes);

            if (!paramsVal.Equals(hashParamsVal) || !hash.Equals(hashParam))
                return false;

            return true;
        }

        private int getOrderCodeFromResponse()
        {
            int code = -1;
            if(Request.Form != null && Request.Form["oid"] != null)
            {
                //int.TryParse(Request.Form["oid"], out code);
                return getOrderCodeNumber(Request.Form["oid"]);
            }

            return code;
        }

        private Dictionary<string, string> getPaymenyParameters()
        {
            Dictionary<string, string> parameters = new Dictionary<string, string>();
            string[] paymentParameters = ConfigurationManager.AppSettings["paymentParameters"].Split(',');

            foreach (string parameter in paymentParameters)
                if (Request.Form[parameter] != null && Request.Form[parameter] != "")
                    parameters.Add(parameter, Request.Form[parameter]);

            return parameters;
        }

        private PaymentResponse GetPaymentResponse()
        {
            PaymentResponse paymentResponse = new PaymentResponse();
            paymentResponse.ReturnOid = Request.Form["ReturnOid"];
            paymentResponse.TranId = Request.Form["TRANID"];
            paymentResponse.HashAlgorithm = Request.Form["hashAlgorithm"];
            paymentResponse.MerchantID = Request.Form["merchantID"];
            paymentResponse.Acqbin = Request.Form["ACQBIN"];
            paymentResponse.Ecom_Payment_Card_ExpDate_Year = Request.Form["Ecom_Payment_Card_ExpDate_Year"];
            paymentResponse.Ecom_Payment_Card_ExpDate_Month = Request.Form["Ecom_Payment_Card_ExpDate_Month"];
            paymentResponse.ExtraCardBrand = Request.Form["EXTRA.CARDBRAND"];
            paymentResponse.AcqStan = Request.Form["acqStan"];
            paymentResponse.clientIP = Request.Form["clientIp"];
            paymentResponse.Md = Request.Form["mdStatus"] != null ? Request.Form["mdStatus"] : string.Empty;
            paymentResponse.ProcReturnCode = Request.Form["ProcReturnCode"];
            paymentResponse.TransId = Request.Form["TransId"];
            paymentResponse.Response = Request.Form["Response"];
            paymentResponse.SettleId = Request.Form["SettleId"];
            paymentResponse.MdErrorMsg = Request.Form["mdErrorMsg"];
            paymentResponse.ErrMsg = Request.Form["ErrMsg"];
            paymentResponse.HostRefNum = Request.Form["HostRefNum"];
            paymentResponse.AuthCode = Request.Form["AuthCode"];
            paymentResponse.Xid = Request.Form["xid"];
            paymentResponse.Oid = Request.Form["oid"];
            paymentResponse.Hash = Request.Form["HASH"];
            paymentResponse.Amount = Request.Form["amount"];
            paymentResponse.HashParams = Request.Form["HASHPARAMS"];
            paymentResponse.HashParamsVal = Request.Form["HASHPARAMSVAL"];
            paymentResponse.Date = DateTime.Now;

            //dodaj
            //new GenericRepository<PaymentResponse>().Insert(paymentResponse);

            return paymentResponse;
        }

        private string getResponseHeader(string response)
        {
            switch (response)
            {
                case "Approved": return "Transakcija je odobrena. Plaćanje karticom uspešno realizovano.";
                case "Failed":
                case "Declined":
                case "Error": return "Transakcija nije odobrena. Plaćanje karticom neuspešno.";
            }
            return string.Empty;
        }

        private string getMessage(string response, string amount)
        {
            switch (response)
            {
                case "Approved":
                    return "Plaćanje uspešno izvršeno. Račun platne kartice zadužen za iznos od: <span class='bold'>" + string.Format("{0:N2}", double.Parse(amount, new CultureInfo("en-US"))) + "</span> RSD."
           + "<p class='small'>Uskoro će Vam na email adresu stići obaveštenje o porudžbini kao i račun naslovljen na poručioca usluge.</p>";
                case "Failed":
                case "Declined":
                case "Error":
                    return "Račun platne kartice <span class='bold'>NIJE</span> zadužen."
              + "<p class='small'>Najčešći uzrok je pogrešno unet broj kartice, datum isteka ili sigurnosni kod. " +
              "Molimo Vas da proverite unete podatke i pokušate ponovo. U slučaju uzastopnih greški pozovite Vašu banku.</p>";
            }
            return string.Empty;
        }

        private void setDivColor(string response)
        {
            switch(response)
            {
                case "Approved":
                    {
                        boxHeader.Attributes.Add("class", "border p-1 text-center text-white mb-5 mt-2 bg-success");
                        break;
                    }
                case "Failed":
                case "Desclined":
                case "Error":
                    {
                        boxHeader.Attributes.Add("class", "border p-1 text-center text-white mb-5 mt-2 bg-danger");
                        break;
                    }
            }
        }

        private string setMessage(string current, string message, bool overwrite = true)
        {
            if(string.IsNullOrWhiteSpace(current))
            {
                return message;
            }

            return current + "<br>" + message;
        }

        private int getOrderCodeNumber(string oid)
        {
            int codeNumber = -1;

            if(!oid.Contains("/"))
            {
                int.TryParse(oid, out codeNumber);
                return codeNumber;
            }

            oid = oid.Substring(0, oid.IndexOf("/"));

            int.TryParse(oid, out codeNumber);

            return codeNumber;
        }
    }
}
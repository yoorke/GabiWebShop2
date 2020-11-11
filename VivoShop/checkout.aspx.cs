using eshopBE;
using eshopBL;
using eshopUtilities;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace VivoShop
{
    public partial class checkout : System.Web.UI.Page
    {
        private Settings _settings;

        public Settings Settings { get { return _settings; } }

        public checkout()
        {
            _settings = new SettingsBL().GetSettings();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            { 
                loadIntoForm();
                loadCart();

                if (HttpContext.Current.User.Identity.IsAuthenticated)
                    loadUser();
            }
        }

        protected void rdbDelivery_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void loadIntoForm()
        {
            cmbShop.Items.Add(new ListItem("Gabi boje, Hunjadi Janoša 33, Zrenjanin", "1"));

            List<Payment> paymentMethods = new List<Payment>();
            paymentMethods.Add(new Payment(1, "Gotovina pri preuzimanju", "Kupac plaća kuriru prilikom preuzimanja robe."));
            paymentMethods.Add(new Payment(2, "Ček", "Kupac plaća čekom."));
            paymentMethods.Add(new Payment(3, "Uplatnica", "Kupac plaća uplatnicom u pošti ili banci. Roba se šalje nakon evidentirane uplate."));
            paymentMethods.Add(new Payment(4, "Virmansko plaćanje po predračunu", ""));
            paymentMethods.Add(new Payment(5, "Kartica", ""));

            rptPaymentMethods.DataSource = paymentMethods;
            rptPaymentMethods.DataBind();
        }

        protected void rptPaymentMethods_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                if(e.Item.ItemIndex == 0) { 
                    HtmlInputRadioButton rdbPaymentMethod = (HtmlInputRadioButton)e.Item.FindControl("rdbPaymentMethod");
                    rdbPaymentMethod.Checked = true;
                    //rdbPaymentMethod.Attributes.Add("checked", "true");

                    HtmlGenericControl paymentItem = (HtmlGenericControl)e.Item.FindControl("paymentItem");
                    paymentItem.Attributes.Add("class", paymentItem.Attributes["class"] + " payment-methods__item--active");
                }
            }
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            int userID = createUser();
            Order order = createOrder(userID, getPaymentID(), getDeliveryID());

            Settings settings = new SettingsBL().GetSettings();

            Common.SendOrderConfirmationMail(txtEmail.Text, txtFirstName.Text + " " + txtLastName.Text, order, settings);
            Common.SendNewOrderNotification(order.OrderID.ToString(), order, settings);

            new CartBL().ClearItems(Session["cartID"].ToString());
            new CartBL().RemoveCoupon(Session["cartID"].ToString());

            Page.Response.Redirect("/porudzbina-uspesna");
        }

        private int getPaymentID()
        {
            int paymentID = -1;
            foreach (RepeaterItem item in rptPaymentMethods.Items)
            {
                if (((HtmlInputRadioButton)item.FindControl("rdbPaymentMethod")).Checked)
                    int.TryParse(((HiddenField)item.FindControl("lblPaymentID")).Value, out paymentID);
            }
            return paymentID;
        }

        private int getDeliveryID()
        {
            int deliveryID = -1;
            if (rdbDeliveryService.Checked)
                return 1;
            else if (rdbPickInStore.Checked)
                return 2;

            return deliveryID;
        }

        private int createUser()
        {
            int userID = -1;
            if (checkoutcreateaccount.Checked)
            {
                userID = UserBL.SaveUser(txtFirstName.Text, txtLastName.Text, txtEmail.Text, string.Empty, txtEmail.Text, txtAddress.Text, txtCity.Text, txtPhone.Text, "kupac", txtZip.Text).UserID;
                if (userID > 0)
                    FormsAuthentication.SetAuthCookie(txtEmail.Text, true);
            }
            else if (Membership.GetUser() != null)
                userID = int.Parse(Membership.GetUser().ProviderUserKey.ToString());
            else
                userID = 42;

            return userID;
        }

        private List<OrderItem> getItems()
        {
            DataTable cartItems = new CartBL().GetProducts(Session["cartID"].ToString());

            List<OrderItem> items = new List<OrderItem>();
            foreach (DataRow row in cartItems.Rows)
                items.Add(new OrderItem(-1, -1, 
                    //new Product() { ProductID = int.Parse(row["productID"].ToString()) }, 
                    new ProductBL().GetProduct(int.Parse(row["productID"].ToString()), string.Empty, false, string.Empty),
                    double.Parse(row["productPrice"].ToString()), double.Parse(row["userPrice"].ToString()), double.Parse(row["quantity"].ToString())));

            return items;
        }

        private Order createOrder(int userID, int paymentID, int deliveryID)
        {
            Order order = new Order();
            order.Date = DateTime.Now.ToUniversalTime();
            order.Firstname = txtFirstName.Text;
            order.Lastname = txtLastName.Text;
            order.Address = txtAddress.Text;
            order.City = txtCity.Text;
            order.Phone = txtPhone.Text;
            order.Email = txtEmail.Text;
            order.Items = getItems();
            order.User = new User(userID, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, string.Empty, null, string.Empty, string.Empty, DateTime.Now, string.Empty, 0, -1);
            order.Name = txtCompanyName.Text;
            //order.Pib = txtPib.Text;
            order.Payment = new Payment(paymentID, string.Empty);
            order.Delivery = new Delivery(deliveryID, string.Empty);
            order.Coupon = new Coupon(new CartBL().GetCartCoupon(Session["cartID"].ToString()), string.Empty, 0, string.Empty, DateTime.Now, DateTime.Now, null, null);
            order.OrderStatus = new OrderStatus(1, string.Empty, false);
            order.Zip = txtZip.Text;
            order.Comment = txtComment.Text;
            order.CartID = Session["cartID"].ToString();
            order.Pib = txtTaxID.Text;

            new OrderBL().SaveOrder(order);

            return order;
        }

        private void loadUser()
        {
            User user = UserBL.GetUser(-1, HttpContext.Current.User.Identity.Name);

            txtFirstName.Text = user.FirstName;
            txtLastName.Text = user.LastName;
            txtEmail.Text = user.Email;
            txtAddress.Text = user.Address;
            txtCity.Text = user.City;
            txtPhone.Text = user.Phone;
            txtZip.Text = user.Zip;
            checkoutcreateaccount.Checked = false;
            checkoutcreateaccount.Attributes.Add("disabled", "true");
        }

        protected void rptCart_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }

        private void loadCart()
        {
            DataTable cartItems = new CartBL().GetProducts(Session["cartID"].ToString());
            rptCart.DataSource = cartItems;
            rptCart.DataBind();

            int productsCount = cartItems.Rows.Count;
            double cartTotal = 0;
            double discount = 0;
            double subTotal = 0;
            double tax = 0;
            double shopTotal = 0;
            double deliveryCost = 0;
            double total = 0;
            double saving = 0;
            bool freeDelivery = false;

            foreach(DataRow row in cartItems.Rows)
            {
                cartTotal += double.Parse(row["productPrice"].ToString()) * double.Parse(row["quantity"].ToString());
                discount += double.Parse(row["productPrice"].ToString()) * double.Parse(row["quantity"].ToString()) - double.Parse(row["userPrice"].ToString()) * double.Parse(row["quantity"].ToString());
            }

            shopTotal = cartTotal - discount;
            subTotal = shopTotal / 1.2;
            tax = shopTotal - subTotal;
            saving = cartTotal - shopTotal;
            freeDelivery = shopTotal >= _settings.FreeDeliveryTotalValue;

            //Settings settings = new SettingsBL().GetSettings();

            if (bool.Parse(ConfigurationManager.AppSettings["calculateDelivery"]))
            {
                if (getDeliveryID() == 1 && shopTotal < double.Parse(ConfigurationManager.AppSettings["freeDeliveryTotalValue"]))
                    deliveryCost = _settings.DeliveryCost;

                lblDeliveryCost.Text = string.Format("{0:N2}", deliveryCost);
            }
            else
            {
                deliveryCost = 0;
                lblDeliveryCost.Text = getDeliveryID() == 1 && shopTotal < _settings.FreeDeliveryTotalValue ? "Po cenovniku kurirske službe" : "0,00";
            }

            total = shopTotal + deliveryCost;

            lblProductsCount.Text = productsCount.ToString();
            lblCartTotal.Text = string.Format("{0:N2}", cartTotal);
            lblDiscount.Text = string.Format("{0:N2}", discount);
            lblSubtotal.Text = string.Format("{0:N2}", subTotal);
            lblTax.Text = string.Format("{0:N2}", tax);
            lblShopTotal.Text = string.Format("{0:N2}", shopTotal);
            lblTotal.Text = string.Format("{0:N2}", total);
            if (!bool.Parse(ConfigurationManager.AppSettings["calculateDelivery"]) && getDeliveryID() == 1 && shopTotal < _settings.FreeDeliveryTotalValue)
                lblTotalComment.Text += " + troškovi dostave";
        }
    }
}
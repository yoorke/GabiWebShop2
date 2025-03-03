using eshopBL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace VivoShop
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            new RoutesBL().RegisterRoutes();
            new SitemapBL().SaveSitemap();
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            if (Request.Cookies["cartID"] != null)
                Session.Add("cartID", Request.Cookies["cartID"].Value);
            else
            {
                Guid guid = Guid.NewGuid();
                Session.Add("cartID", guid.ToString());
                HttpCookie cookie = new HttpCookie("cartID");
                cookie.Expires = DateTime.Now.AddDays(30);
                cookie.Value = guid.ToString();
                Response.Cookies.Add(cookie);
            }
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            //if(((bool.Parse(ConfigurationManager.AppSettings["useSSL"]) && !HttpContext.Current.Request.IsSecureConnection)
            //|| !HttpContext.Current.Request.Url.ToString().ToLower().StartsWith(ConfigurationManager.AppSettings["webShopUrl"]))
            //&& !HttpContext.Current.Request.IsLocal)
            //{
            //Response.RedirectPermanent(ConfigurationManager.AppSettings["webShopUrl"] + HttpContext.Current.Request.RawUrl);
            //}
            //if(!Request.Url.PathAndQuery.Equals("/"))
            //Response.Redirect("/");

            //if(bool.Parse(ConfigurationManager.AppSettings["redirectCategoryByUrl"]) //&& //!Request.IsLocal
            //)
            //{
            //if (Application["redirectUrls"] == null)
            //Application.Add("redirectUrls", new Redirect().LoadUrls());

            //string url = Request.RawUrl;
            //if (Request.QueryString.ToString() != string.Empty)
            //url = url.Substring(0, url.IndexOf("?"));
            //if (((Dictionary<string, string>)Application["redirectUrls"]).ContainsKey(url))
            //Response.RedirectPermanent(((Dictionary<string, string>)Application["redirectUrls"])[url] + (Request.RawUrl.Contains("?") ? "?" + Request.QueryString.ToString() : string.Empty));
            //}

            if(bool.Parse(ConfigurationManager.AppSettings["redirectByRedirectFile"]) && !Request.IsLocal)
            {
                if (Application["redirectUrls"] == null)
                    Application.Add("redirectUrls", new Redirect().LoadUrls());

                string url = Request.Url.AbsolutePath;
                if (((Dictionary<string, string>)Application["redirectUrls"]).ContainsKey(url))
                    Response.RedirectPermanent(((Dictionary<string, string>)Application["redirectUrls"])[url] + Request.Url.Query);
            }

            if (Request.RawUrl.EndsWith("cart.html"))
                Response.RedirectPermanent(ConfigurationManager.AppSettings["webShopUrl"] + "/korpa");

            //if (!Request.RawUrl.ToLower().Contains("webshopadmin") && !Request.RawUrl.ToLower().Contains("index-maintenance"))
                //Response.Redirect("/index-maintenance.html");
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            Exception ex = Server.GetLastError();
            if (ex is System.Threading.ThreadAbortException)
                return;

            eshopUtilities.ErrorLog.LogError(ex, Request.RawUrl, Request.UserHostAddress, Request.Url.ToString());
            Server.Transfer("~/error.aspx");
        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}
using eshopBL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Xml;

namespace VivoShop
{
    /// <summary>
    /// Summary description for SitemapHandler
    /// </summary>
    public class SitemapHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            //context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");

            context.Response.ContentType = "text/xml";
            context.Response.ContentEncoding = Encoding.UTF8;

            XmlDocument xmlDoc = new WebSitemapBL().CreateSitemap();
            xmlDoc.Save(HttpContext.Current.Server.MapPath("~/sitemap.xml"));
            xmlDoc.Save(context.Response.Output);

            context.Response.End();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}
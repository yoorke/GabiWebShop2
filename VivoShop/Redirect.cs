using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Web;
using eshopUtilities;

namespace VivoShop
{
    public class Redirect
    {
        public void RedirectUrl(string url)
        {
            Dictionary<string, string> urls = new Dictionary<string, string>();

            string line;
            using (StreamReader sr = new StreamReader(HttpContext.Current.Server.MapPath("~/redirect.txt")))
            {
                while ((line = sr.ReadLine()) != null)
                    urls.Add(line.Split(',')[0], line.Split(',')[1]);
            }

            url = url.Contains('?') ? url.Substring(0, url.IndexOf('?')) : url;

            if(urls.ContainsKey(url))
                HttpContext.Current.Response.RedirectPermanent(urls[url] + (HttpContext.Current.Request.QueryString.ToString() != string.Empty ? "?" + HttpContext.Current.Request.QueryString.ToString() : string.Empty));
        }

        public Dictionary<string, string> LoadUrls()
        {
            Dictionary<string, string> urls = new Dictionary<string, string>();
            string line;
            using (StreamReader sr = new StreamReader(HttpContext.Current.Server.MapPath("~/redirect.txt")))
            {
                while ((line = sr.ReadLine()) != null)
                    urls.Add(line.Split(',')[0], line.Split(',')[1]);
            }

            return urls;
        }

        public Dictionary<string, string> LoadCategoryRedirectUrls()
        {
            Dictionary<string, string> urls = new Dictionary<string, string>();
            string line;
            using (StreamReader sr = new StreamReader(HttpContext.Current.Server.MapPath("~/categoryRedirectUrls.txt")))
            {
                while ((line = sr.ReadLine()) != null)
                    urls.Add(line.Split(',')[0], line.Split(',')[1]);
            }
            return urls;
        }

        public void RedirectCategoryUrl(string url)
        {
            string queryString = url.Contains('?') ? url.Substring(url.IndexOf('?') + 1) : string.Empty;
            url = url.Contains('?') ? url.Substring(0, url.IndexOf('?')) : url;

            if (HttpContext.Current.Application["categoryRedirectUrls"] == null)
                HttpContext.Current.Application.Add("categoryRedirectUrls", LoadCategoryRedirectUrls());

            Dictionary<string, string> urls = (Dictionary<string, string>)HttpContext.Current.Application["categoryRedirectUrls"];
            if (urls.ContainsKey(url))
                HttpContext.Current.Response.RedirectPermanent(urls[url] + (queryString != string.Empty ? "?" : string.Empty) + queryString);

            ErrorLog.LogError(new Exception("Category url: " + url));
        }

        public string GetCategoryRedirectUrl(string url)
        {
            string queryString = url.Contains('?') ? url.Substring(url.IndexOf('?') + 1) : string.Empty;
            url = url.Contains('?') ? url.Substring(0, url.IndexOf('?')) : url;

            if (HttpContext.Current.Application["categoryRedirectUrls"] == null)
                HttpContext.Current.Application.Add("categoryRedirectUrls", LoadCategoryRedirectUrls());

            Dictionary<string, string> urls = (Dictionary<string, string>)HttpContext.Current.Application["categoryRedirectUrls"];

            if (urls.ContainsKey(url))
                return urls[url] + (queryString != string.Empty ? "?" : string.Empty) + queryString;

            return string.Empty;
        }
    }
}
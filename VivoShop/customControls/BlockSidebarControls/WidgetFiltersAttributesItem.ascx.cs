using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.BlockSidebarControls
{
    public partial class WidgetFiltersAttributesItem : System.Web.UI.UserControl
    {
        public eshopBE.Attribute Attribute
        {
            set
            {
                loadAttributes(value);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void loadAttributes(eshopBE.Attribute attribute)
        {
            lblTitle.Text = attribute.Name;

            rptAttributeValues.DataSource = attribute.Values;
            rptAttributeValues.DataBind();
        }

        protected void rptAttributeValues_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string attributeValueID = ((HiddenField)e.Item.FindControl("lblAttributeID")).Value + "-" + ((HiddenField)e.Item.FindControl("lblAttributeValueID")).Value;
                ((HtmlGenericControl)e.Item.FindControl("attributeSpan")).Attributes.Add("attributevalue", attributeValueID);

                if(queryStringContaines(attributeValueID))
                {
                    ((HtmlInputCheckBox)e.Item.FindControl("chkAttributeValueID")).Checked = true;
                }
            }
        }

        private bool queryStringContaines(string attributeValueID)
        {
            if (!Page.Request.QueryString.ToString().Contains("attributes"))
                return false;

            if (Page.Request.QueryString["attributes"].Split(',').Contains(attributeValueID))
                return true;

            return false;
        }
    }
}
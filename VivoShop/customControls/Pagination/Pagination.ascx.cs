using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace VivoShop.customControls.Pagination
{
    public partial class Pagination : System.Web.UI.UserControl
    {
        private int _totalPages;
        private int _currentPage;
        private int _firstIndex;
        private int _lastIndex;

        public int CurrentPage
        {
            set { _currentPage = value; }
        }

        public int TotalPages
        {
            set { _totalPages = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void rptPagination_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                HyperLink lnkPage = (HyperLink)e.Item.FindControl("lnkPage");
                HtmlGenericControl pageLi = (HtmlGenericControl)e.Item.FindControl("pageLi");
                if (!lnkPage.Text.Equals("..."))
                {
                    lnkPage.Attributes.Add("onclick", "changePage(" + lnkPage.Text + ")");
                    if (lnkPage.Text == (_currentPage + 1).ToString())
                    {
                        lnkPage.Font.Bold = true;
                        pageLi.Attributes["class"] = "page-item active";
                    }
                    else
                    { 
                        
                    }
                }
                else
                    lnkPage.Attributes["class"] = "dot";
            }
        }

        public void DoPaging()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("PageIndex");
            dt.Columns.Add("PageText");

            DataRow newRow = dt.NewRow();
            newRow[0] = 0;
            newRow[1] = 1;
            dt.Rows.Add(newRow);

            _firstIndex = _currentPage - 3;

            if (_firstIndex < 1)
                _firstIndex = 1;

            _lastIndex = _currentPage < 5 ? 8 : _currentPage + 4;

            if(_lastIndex > _totalPages - 1)
            {
                _lastIndex = _totalPages - 1;
                _firstIndex = _lastIndex - 7;
                if (_firstIndex < 1)
                    _firstIndex = 1;
            }

            for (int i = _firstIndex; i < _lastIndex; i++)
            {
                DataRow dr = dt.NewRow();
                dr[0] = i;
                dr[1] = i + 1;
                dt.Rows.Add(dr);
            }

            if (_lastIndex - _firstIndex > -1)
            {
                newRow = dt.NewRow();
                newRow[0] = _totalPages - 1;
                newRow[1] = _totalPages;
                dt.Rows.Add(newRow);
            }

            newRow = dt.NewRow();
            newRow[0] = -1;
            newRow[1] = "...";
            if (dt.Rows.Count > 1 && int.Parse(dt.Rows[1][0].ToString()) > 1)
                dt.Rows.InsertAt(newRow, 1);

            newRow = dt.NewRow();
            newRow[0] = -1;
            newRow[1] = "...";

            if (dt.Rows.Count > 2)
                if (int.Parse(dt.Rows[dt.Rows.Count - 2][0].ToString()) < _totalPages - 2)
                    dt.Rows.InsertAt(newRow, dt.Rows.Count - 1);

            rptPagination.DataSource = dt;
            rptPagination.DataBind();
        }
    }
}
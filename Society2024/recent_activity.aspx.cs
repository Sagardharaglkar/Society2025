using BusinessLogic.MasterBL;
using DBCode.DataClass.Master_Dataclass;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utility.DataClass;

namespace Society
{
    public partial class recent_activity : System.Web.UI.Page
    {

        BL_User_Login BL_Login = new BL_User_Login();
        Login_Details details = new Login_Details();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }

            if (!IsPostBack)
            {
                gridBind();
            }
        }

          
        protected void btn_search_Click(object sender, EventArgs e)
        {

            gridBind();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Refocus", "refocusAfterPostback();", true);

        }

        protected void gridBind()
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            int count = 1;
                          sb.Append("Select *  from recent_activity_vw where society_id='" + Session["Society_id"].ToString() + "'");


            if (txt_search.Text != "")
            {
                if (count > 0)
                {
                    sb.Append(" or ");
                }
               
                sb.Append(" particular like '" + txt_search.Text + "%'or cast (received_amt as varchar) like '" + txt_search.Text + 
                    "%'or type like '" + txt_search.Text+ "%'or cast (m_date as varchar) like '" + txt_search.Text + "%'");
                count++;
            }
           if (activityType.SelectedItem.Text != "All")
                    {
                        if (count > 0)
                        {
                            sb.Append(" AND ");
                        }
                        sb.Append(" type = '" + activityType.SelectedItem.Text + "'");
                        count++;
                    }

                    if (dateFrom.Value != "" && dateTo.Value != "")
                    {
                        if (count > 0)
                        {
                            sb.Append(" AND ");
                        }
                        sb.Append(" m_date between  '" + dateFrom.Value + "' and '" + dateTo.Value + "'");
                        count++;
            }
            if (minPriceHidden.Value != "" && maxPriceHidden.Value != "")
            {
                if (count > 0)
                {
                    sb.Append(" AND ");
                }
                sb.Append(" received_amt between  '" + minPriceHidden.Value + "' and '" + maxPriceHidden.Value + "'");
                count++;
            }
            sb.Append("order by date desc");
                details.Sql_Operation = "RecentActivity";
            details.Name = sb.ToString();
            

            var result = BL_Login.get_recent_Search(details);


            GridView1.DataSource = result;
            ViewState["dirState"] = result;
            GridView1.DataBind();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Refocus", "refocusAfterPostback();", true);
        }

        protected void btnApplyFilters_Click(object sender, EventArgs e)
        {
       
             gridBind();


            string chipsHtml = "";

            if (!string.IsNullOrEmpty(details.From_date) || !string.IsNullOrEmpty(details.To_date))
            {
                chipsHtml += $"<span class='filter-chip' id='chip-date'>📅 {details.From_date} – {details.To_date} <button onclick=\"removeFilter('date')\">×</button></span>";
            }

            if (!string.IsNullOrEmpty(details.Recent_Type))
            {
                chipsHtml += $"<span class='filter-chip' id='chip-type'>🛠️ Type: {details.Recent_Type} <button onclick=\"removeFilter('type')\">×</button></span>";
            }

            if (!string.IsNullOrEmpty(details.Min_Price) || !string.IsNullOrEmpty(details.Max_Price))
            {
                chipsHtml += $"<span class='filter-chip' id='chip-price'>💰 ₹{details.Min_Price} – ₹{details.Max_Price   } <button onclick=\"removeFilter('price')\">×</button></span>";
            }

            // Assign HTML to filterChips div
            filterChips.InnerHtml = chipsHtml;

            // Close the filter sidebar after applying filters
            ScriptManager.RegisterStartupScript(this, GetType(), "hideSidebar", "document.getElementById('filterSidebar').classList.remove('show');", true);

        }

    }
}                          
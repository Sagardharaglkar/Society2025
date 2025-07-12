using BusinessLogic.MasterBL;
using DBCode.DataClass.Master_Dataclass;
using System;
using System.Collections.Generic;
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
                GetDataForRecent();
            }
        }

            public void GetDataForRecent()
        {

            details.Sql_Operation = "RecentActivity";
            details.Society_Id = Session["society_id"].ToString();

            var dt = BL_Login.get_recent_chart(details);

            GridView1.DataSource = dt;
            GridView1.DataBind();

        }

        protected void btn_search_Click(object sender, EventArgs e)
        {

            gridBind();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Refocus", "refocusAfterPostback();", true);

        }

        protected void gridBind()
        {
            details.Sql_Operation = "search";
            details.society_id = Session["society_id"].ToString(); ;
            details.Name = txt_search.Text;
            details.From_date = dateFrom.Value;
            details.To_date = dateTo.Value;
            details.Recent_Type = activityType.SelectedValue;
            details.Min_Price = minPriceHidden.Value;
            details.Max_Price = maxPriceHidden.Value;

            var result = BL_Login.get_recent_Search(details);
            GridView1.DataSource = result;
            ViewState["dirState"] = result;
            GridView1.DataBind();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Refocus", "refocusAfterPostback();", true);
        }

        protected void btnApplyFilters_Click(object sender, EventArgs e)
        {
            // Filter values from HiddenFields


            gridBind();


            // Apply filters to your data source and bind to GridView
            //BindGridWithFilters(fromDate, toDate, type, minPrice, maxPrice);

            // Generate filter chips HTML
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
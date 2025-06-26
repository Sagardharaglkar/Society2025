using BusinessLogic.MasterBL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utility.DataClass;

namespace Society2024
{
    public partial class Admin_Dashboard : System.Web.UI.Page
    {
        BL_User_Login BL_Login = new BL_User_Login();
        Login_Details details = new Login_Details();
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }
            society_id.Value = Session["society_id"].ToString();

            if (!IsPostBack)
            {
                //defaulter_Click(sender, e);
                filldrop();
                //date_before.Text = DateTime.Now.ToShortDateString();
                btn_search_Click(sender, e);
            }
        }

        public void filldrop()
        {
            String sql_query = "Select *  from society_master";
            //BL_Login.fill_drop(drp_society, sql_query, "name", "society_id");
            String sql_query1 = "Select *  from state";
            BL_Login.fill_drop(drp_state, sql_query1, "state", "state_id");
            String sql_query2 = "Select *  from district";
            BL_Login.fill_drop(drp_district, sql_query2, "district", "district_id");

            String sql_query3 = "Select distinct city from society_master where city is not null";
            BL_Login.fill_drop(drp_city, sql_query3, "city", "city");

            String sql_query4 = "Select distinct division,division_id from division where division is not null";
            BL_Login.fill_drop(drp_division, sql_query4, "division", "division_id");

        }
        protected void btn_search_Click(object sender, EventArgs e)
        {

            details.Sql_Operation = "search";
            details.Name = txt_search.Text;
            var result = BL_Login.search_admin(details);
            GridView1.DataSource = result;
            ViewState["dirState"] = result;
            GridView1.DataBind();


            //System.Text.StringBuilder sb = new System.Text.StringBuilder();
            // sb.Append("SELECT * FROM admin_vw WHERE (society_id = '" + society_id.Value + "')");

            //if (drp_society.SelectedValue != "select")
            //{
            //    sb.Append(" AND name = '" + drp_society.SelectedItem.Text.Replace("'", "''") + "'");
            //}

            //if (!string.IsNullOrEmpty(txt_search.Text))
            //{
            //    sb.Append(" AND (address LIKE '" + txt_search.Text.Replace("'", "''") + "%'");
            //    sb.Append(" OR pincode LIKE '" + txt_search.Text.Replace("'", "''") + "%'");

            //    // ✅ Fix: Use '=' for numeric comparison instead of 'LIKE'
            //    if (int.TryParse(txt_search.Text, out int pendingAmount))
            //    {
            //        sb.Append(" OR pending_amount = " + pendingAmount);
            //    }

            //    sb.Append(")"); // Closing parenthesis for grouped OR conditions
                
            //}

            //details.Sql_Operation = sb.ToString();
            //var result = BL_Login.search_admin(details);
            //GridView1.DataSource = result;
            //ViewState["dirState"] = result;
            //GridView1.DataBind();

        }

        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataTable dtrslt = (DataTable)ViewState["dirState"];
            if (dtrslt.Rows.Count > 0)
            {
                if (Convert.ToString(ViewState["sortdr"]) == "Asc")
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Desc";
                    ViewState["sortdr"] = "Desc";
                }
                else
                {
                    dtrslt.DefaultView.Sort = e.SortExpression + " Asc";
                    ViewState["sortdr"] = "Asc";
                }
                GridView1.DataSource = dtrslt;
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

        }

        protected void btn_filter_Click(object sender, EventArgs e)
        {
            filterSection.Visible = true;
        }
    }   
}
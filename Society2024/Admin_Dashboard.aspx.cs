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
                fill_drop1();
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

        public void fill_drop1()
        {
            String sql_query = "Select *  from state";
            BL_Login.fill_drop(ddl_state, sql_query, "state", "state_id");
            String sql_query1 = "Select *  from district";
            BL_Login.fill_drop(ddl_district, sql_query1, "district", "district_id");
            String sql_query2 = "Select *  from division";
            BL_Login.fill_drop(ddl_division, sql_query2, "division", "division_id");

        }

        protected void btn_search_Click(object sender, EventArgs e)
        {

            details.Sql_Operation = "AdminSearch";
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
        protected void btnApplyFilters_Click1(object sender, EventArgs e)
        {
            // Get filter values from the controls
           
        }

        private void ApplyFilters(string state, string district, string city, string pincode, decimal minPending, decimal maxPending)
        {
            // Example: Filtering logic (replace with your actual data access logic)

            DataTable dt = (DataTable)ViewState["dirState"];
            var query = dt.AsEnumerable();

            if (!string.IsNullOrEmpty(state))
            {
                query = query.Where(x => x.Field<string>("State") == state);
            }
            if (!string.IsNullOrEmpty(district))
            {
                query = query.Where(x => x.Field<string>("District") == district);
            }
            if (!string.IsNullOrEmpty(city))
            {
                query = query.Where(x => x.Field<string>("City") == city);
            }
            if (!string.IsNullOrEmpty(pincode))
            {
                query = query.Where(x => x.Field<string>("Pincode") == pincode);
            }

            if (minPending > 0)
            {
                query = query.Where(x => x.Field<decimal>("PendingAmount") >= minPending);
            }
            if (maxPending < 100000)
            {
                query = query.Where(x => x.Field<decimal>("PendingAmount") <= maxPending);
            }

            // Convert the filtered rows back to a DataTable
            DataTable filtered = query.CopyToDataTable();

            // Bind to GridView
            GridView1.DataSource = filtered;
            GridView1.DataBind();
        }


        protected void btn_filter_Click(object sender, EventArgs e)
        {
            filterSection.Visible = true;
        }

        protected void btnApplyFilters_Click(object sender, EventArgs e)
        {
            string state = drp_state.SelectedValue;
            string district = drp_district.SelectedValue;
            string city = drp_city.SelectedValue;
            string pincode = txt_pincode.Text;
 

            decimal minpending = Convert.ToDecimal(minPendingHidden.Value);
            decimal maxpending = Convert.ToDecimal(maxPendingHidden.Value);

            // Optional: Add price if needed
            int minprice = Convert.ToInt32(minPriceHidden.Value);
            int maxprice = Convert.ToInt32(maxPriceHidden.Value);

            // Apply filters using all collected values
            ApplyFilters(state, district, city, pincode,  minpending, maxpending /*, minprice, maxprice if needed */);
        }
    }
    }   
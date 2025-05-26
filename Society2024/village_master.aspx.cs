using DataAccessLayer.MasterDA;
using DBCode.DataClass.Master_Dataclass;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Society2024
{
    public partial class village_master : System.Web.UI.Page
    {
        private Village village = new Village();
        private DA_Village_Master dA_Village = new DA_Village_Master();
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        public void fill_drop1()
        {
            //String sql_query = "Select *  from state";
            //bL_Society.fill_drop(ddl_state, sql_query, "state", "state_id");
            //String sql_query1 = "Select *  from district";
            //bL_Society.fill_drop(ddl_district, sql_query1, "district", "district_id");
            //String sql_query2 = "Select *  from division";
            //bL_Society.fill_drop(ddl_division, sql_query2, "division", "division_id");
        }
        protected void search_field_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btn_search_Click(object sender, EventArgs e)
        {

        }

        protected void btn_import_Click(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

        }
    }
}
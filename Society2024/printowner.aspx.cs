using BusinessLogic.MasterBL;
using DBCode.DataClass;
using Microsoft.Reporting.WebForms;

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Society
{
    public partial class printowner : System.Web.UI.Page
    {
      
        Owner owner = new Owner();
        BL_Owner_Master bL_Owner = new BL_Owner_Master();

        protected void Page_Load(object sender, EventArgs e)
        {
            society_id.Value = Session["society_id"].ToString();
            if (!IsPostBack)
            {
                filldrop();
            }
        }
        public void filldrop()
        {
            String sql_query1 = "Select distinct build_name from owner_search_vw  where society_id='" + society_id.Value + "'";
            bL_Owner.fill_drop(ddl_build, sql_query1, "build_name", "build_name");
            String sql_query2 = "Select  distinct w_name from owner_search_vw where society_id='" + society_id.Value + "'";
            bL_Owner.fill_drop(ddl_wing, sql_query2, "w_name", "w_name");

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int count = 1;

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
           

                if (ddl_build.SelectedItem.Text == "select" && ddl_wing.SelectedItem.Text == "select")
                    sb.Append("Select * from owner_search_vw where type='Owner' and active_status=0 and  society_id='" + Session["Society_id"].ToString() + "'");


                else
                {
                    sb.Append(" Select * from owner_search_vw where type='owner' and active_status=0 and  society_id='" + Session["Society_id"].ToString() + "'");

                    if (ddl_build.SelectedItem.Text != "select")
                    {
                        if (count > 0)
                        {
                            sb.Append(" AND ");
                        }
                        sb.Append(" build_name like '" + ddl_build.SelectedItem.Text + "%'");
                        count++;
                    }

                    if (ddl_wing.SelectedItem.Text != "select")
                    {
                        if (count > 0)
                        {
                            sb.Append(" AND ");
                        }
                        sb.Append(" w_name like '" + ddl_wing.SelectedItem.Text + "%'");
                        count++;
                    }
                }

                owner.Sql_Operation = sb.ToString();
                var dt = bL_Owner.get_printowner(owner);

                ReportViewer1.LocalReport.DataSources.Clear();
                ReportDataSource rds = new ReportDataSource("owner", dt);
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("owner_details.rdlc");
                ReportParameter parameter = new ReportParameter("build_name", ddl_build.Text);
                ReportViewer1.LocalReport.SetParameters(parameter);
                ReportViewer1.LocalReport.DataSources.Add(rds);
                ReportViewer1.LocalReport.Refresh();



            }
        

        protected void ddl_build_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_build.Text != "select")
            {

                string sql1 = "Select distinct w_name,wing_id from dbo.flat where society_id='" + society_id.Value + "'and  name='" + ddl_build.SelectedValue + "'";
                bL_Owner.fill_drop(ddl_wing, sql1, "w_name", "wing_id");




            }
        }
    }
}

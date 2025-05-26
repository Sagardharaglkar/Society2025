using BusinessLogic.BL;
using BusinessLogic.MasterBL;
using DBCode.DataClass.Master_Dataclass;
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
    public partial class printvisitor : System.Web.UI.Page
    {
        Visitor visitor = new Visitor();
        BL_Visitor_Master bL_Visitor = new BL_Visitor_Master(); 

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
            String sql_query = "Select distinct build_name from visitor  where society_id='" + society_id.Value + "'";
            bL_Visitor.fill_drop(ddl_build, sql_query, "build_name", "build_name");
            

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            int count = 1;

            System.Text.StringBuilder sb = new System.Text.StringBuilder();
          
                    sb.Append(" Select * from visitor where active_status=0 and society_id='" + Session["Society_id"].ToString() + "'");

                    if (ddl_build.SelectedItem.Text != "select")
                    {
                        if (count > 0)
                        {
                            sb.Append(" AND ");
                        }
                        sb.Append(" build_name like '" + ddl_build.SelectedItem.Text + "%'");

                        count++;
                    }
                    if (ddl_type.SelectedItem.Text != "Select")
                    {
                        if (count > 0)
                        {
                            sb.Append(" AND ");
                        }
                        sb.Append(" type like '" + ddl_type.SelectedValue + "%'");
                        count++;
                    }
                    if (txt_from.Text != "" && txt_to.Text != "")
                    {
                        if (count > 0)
                        {
                            sb.Append(" AND ");
                        }
                        sb.Append(" in_date between  '" + txt_from.Text + "' and '" + txt_to.Text + "'");
                        count++;
                    }
                
                visitor.Sql_Operation = sb.ToString();
                var dt = bL_Visitor.get_printvisitor(visitor);

                ReportViewer1.LocalReport.DataSources.Clear();
                ReportDataSource rds = new ReportDataSource("visitor", dt);
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("visitor.rdlc");
              //ReportParameter parameter = new ReportParameter("build_name", ddl_build.Text);
                ReportParameter parameter = new ReportParameter("build_name", ddl_build.Text);
                ReportViewer1.LocalReport.SetParameters(parameter);
                ReportViewer1.LocalReport.DataSources.Add(rds);
                ReportViewer1.LocalReport.Refresh();

        }
    }
}

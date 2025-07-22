using BusinessLogic.BL;
using Microsoft.Reporting.WebForms;

using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Utility.DataClass;

namespace Society
{
    public partial class printcontact : System.Web.UI.Page
    {

        usefull_Contact Usefull = new usefull_Contact();
        BL_PrintContact bL_printContact = new BL_PrintContact();
        BL_FillRepeater repeater = new BL_FillRepeater();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }
            else
                society_id.Value = Session["society_id"].ToString();
            if (!IsPostBack)
            {
                filldrop();
              
            }
        }
        public void filldrop()
        {
            String sql_query = "Select *  from person_type";
            repeater.fill_list(Repeater1, sql_query);
        }
        protected void CategoryRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "SelectCategory")
            {
                person_id.Value = e.CommandArgument.ToString();

                Usefull.Sql_Operation = "SELECT * FROM usefull_contact_vw WHERE active_status = 0 AND society_id ='"+society_id.Value+ "' AND usefull_contact_id ="+ e.CommandArgument.ToString();
                var dt = bL_printContact.button_click(Usefull);

                if (dt.Rows.Count > 0)
                {
                    ReportViewer1.Visible = true;
                    // ReportViewer1.Reset();
                    ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/usefull_contact.rdlc");
                    ReportDataSource rds = new ReportDataSource("usefull_contact", dt);
                    ReportViewer1.LocalReport.DataSources.Clear();
                    ReportViewer1.LocalReport.DataSources.Add(rds);
                    ReportViewer1.LocalReport.Refresh();
                }
                else
                {
                    ReportViewer1.Visible = false;
                }

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            ddl_per_type_SelectedIndexChanged(sender, e);




            //int count = 1;

            //System.Text.StringBuilder sb = new System.Text.StringBuilder();

            //    if (ddl_per_type.SelectedItem.Text == "select" )
            //        sb.Append("Select * from usefull_contact_vw where active_status=0 and society_id='" + Session["Society_id"].ToString() + "'");


            //    else
            //    {
            //        sb.Append(" Select * from usefull_contact_vw where active_status=0 and society_id='" + Session["Society_id"].ToString() + "'");

            //        if (ddl_per_type.SelectedItem.Text != "select")
            //        {
            //            if (count > 0)
            //            {
            //                sb.Append(" AND ");
            //            }
            //            sb.Append(" p_type_name like '" + ddl_per_type.SelectedItem.Text + "%'");
            //            count++;
            //        }

            //    }




            //    Usefull.Sql_Operation = sb.ToString();
            //    var dt = bL_printContact.button_click(Usefull);


            //    ReportViewer1.LocalReport.DataSources.Clear();
            //    ReportDataSource rds = new ReportDataSource("usefull_contact", dt);
            //    ReportViewer1.LocalReport.ReportPath = Server.MapPath("usefull_contact.rdlc");
            //    ReportViewer1.LocalReport.DataSources.Add(rds);
            //    ReportViewer1.LocalReport.Refresh();

        }

        protected void ddl_per_type_SelectedIndexChanged(object sender, EventArgs e)
        {

            int count = 1;
            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            sb.Append("SELECT * FROM usefull_contact_vw WHERE active_status=0 AND society_id='")
              .Append(Session["Society_id"].ToString()).Append("'");

            if (TextBox1.Text != "select")
            {
                sb.Append(" AND p_type_name LIKE '")
                  .Append(TextBox1.Text).Append("%'");
                count++;
            }

            Usefull.Sql_Operation = sb.ToString();
            var dt = bL_printContact.button_click(Usefull);

            if (dt.Rows.Count > 0)
            {
                ReportViewer1.Visible = true;
               // ReportViewer1.Reset();
                ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/usefull_contact.rdlc");
                ReportDataSource rds = new ReportDataSource("usefull_contact", dt);
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.LocalReport.DataSources.Add(rds);
                ReportViewer1.LocalReport.Refresh();
            }
            else
            {
                ReportViewer1.Visible = false;
            }

        }

    }
}

    



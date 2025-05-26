using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Web.Configuration;
using BusinessLogic.BL;
using Utility.DataClass;
using System.Windows.Forms;

namespace Society
{

    public partial class usefull_contactDataset : Page
    {
        BL_Usefull_Contact bL_Usefull_Contact = new BL_Usefull_Contact();
        usefull_Contact contact = new usefull_Contact();


        public void fill_drop(DropDownList drp_down, string sqlstring, string text, string value)
        {
            bL_Usefull_Contact.fill_drop(drp_down, sqlstring, text, value);
        }

        //stored st = new stored();
        protected void Page_Load(object sender, System.EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }
            society_id.Value = Session["society_id"].ToString();
            if (!IsPostBack)
            {
                filldrop();
                if (Request.QueryString["usefull_contact_id"] != null)
                {
                    usefull_contact_id.Value = Request.QueryString["usefull_contact_id"];
                    runproc("Select");
                }

            }


        }

        public void filldrop()
        {
            String sql_query = "Select *  from person_type";
            bL_Usefull_Contact.fill_drop(drp_per_type, sql_query, "p_type_name", "p_type_id");
        }

       
        public void runproc_save(string operation)
        {

                if (usefull_contact_id.Value != "")
                    contact.usefull_contact_id = Convert.ToInt32(usefull_contact_id.Value.ToString());
                contact.Sql_Operation = operation;
                contact.Society_Id = society_id.Value;
            contact.P_Name = txt_p_name.Text;
            contact.P_Type = Convert.ToInt32(drp_per_type.SelectedValue);
            contact.Org_Name = txt_org_name.Text;
            contact.Contact_Address = txt_org_addr1.Text;
            contact.Address2 = txt_org_addr2.Text;
            contact.Contact_No = txt_org_tel.Text;
            contact.Email = txt_email.Text;
            contact.Remark = txt_remark.Text;
            bL_Usefull_Contact.update_Usefull_Contact_Details(contact);
           
        }



        public void runproc(string operation)
        {
            if (usefull_contact_id.Value != "")
                contact.usefull_contact_id = Convert.ToInt32(usefull_contact_id.Value);
            contact.Sql_Operation = operation;
            var result = bL_Usefull_Contact.update_Usefull_Contact_Details(contact);

            usefull_contact_id.Value = result.usefull_contact_id.ToString();
            society_id.Value = result.Society_Id;
            txt_p_name.Text = result.P_Name;
            drp_per_type.SelectedValue = result.P_Type.ToString();
            txt_org_name.Text = result.Org_Name;
            txt_org_addr1.Text = result.Contact_Address;
            txt_org_addr2.Text = result.Address2;
            txt_org_tel.Text = result.Contact_No;
            txt_email.Text = result.Email;
            txt_remark.Text = result.Remark;

        }


        protected void btn_save_Click(object sender, EventArgs e)
        {

            runproc_save("Update");
            Response.Redirect("contact_master.aspx");
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
           
                if (usefull_contact_id.Value != "")
                    contact.usefull_contact_id = Convert.ToInt32(usefull_contact_id.Value.ToString());
                contact.Sql_Operation = "Delete";
                bL_Usefull_Contact.delete(contact);

            Response.Redirect("usefull_contact.aspx");

        }

        protected void btn_close_Click(object sender, EventArgs e)
        {
            Response.Redirect("contact_master.aspx");
        }

        protected void drp_per_type_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (usefull_contact_id.Value != "")
                contact.usefull_contact_id = Convert.ToInt32(usefull_contact_id.Value);
            contact.Sql_Operation = "p_name_already_exist";
            contact.P_Name = txt_p_name.Text;
            contact.P_Type = Convert.ToInt32(drp_per_type.SelectedValue.ToString());
            var result =bL_Usefull_Contact.Per_Type_SelectIndexChanged(contact);

            Label10.Text = result.Sql_Result;

            if (Label10.Text != "")
                btn_save.Enabled = false;
            else
                btn_save.Enabled = true;


            }
        }

        
    }

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
using Utility.DataClass;
using BusinessLogic.BL;
using DataAccessLayer.DA;

namespace Society
{
    public partial class contact_master : Page
    {
        BL_FillRepeater repeater = new BL_FillRepeater();
        usefull_Contact contact = new usefull_Contact();
        BL_Contact_Master bL_Contact = new BL_Contact_Master();


      
      

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }else
                society_id.Value = Session["society_id"].ToString();
            gvbind1();
            gvbind2();
            gvbind3();
            gvbind4();
            gvbind5();
            gvbind6();
            gvbind7();
            gvbind8();
            gvbind9();
            gvbind10();
            gvbind11();
            
            if (!IsPostBack)
            {
                String str = "Select *  from person_type";
                repeater.fill_list(categoryRepeater, str);

                if (Request.QueryString["usefull_contact_id"] != null)
                {
                    usefull_contact_id.Value = Request.QueryString["usefull_contact_id"];
                    runproc("Select");
                    ClientScript.RegisterStartupScript(this.GetType(), "Pop", "openModal();", true);
                }
            }

        }


        protected void CategoryRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "SelectCategory")
            {
                contact_type_id.Value = e.CommandArgument.ToString();

            }
        }

        //stored st = new stored();

        //public void filldrop()
        //{
        //    String sql_query = "Select *  from person_type";
        //    bL_Contact.fill_drop(contactRepeater, sql_query);
        //}


        public void runproc_save(string operation)
        {

            if (usefull_contact_id.Value != "")
                contact.usefull_contact_id = Convert.ToInt32(usefull_contact_id.Value.ToString());
            contact.Sql_Operation = operation;
            contact.Society_Id = society_id.Value;
            contact.P_Name = txt_p_name.Text;
            contact.P_Type = Convert.ToInt32(contact_type_id.Value);
            contact.Org_Name = txt_org_name.Text;
            contact.Contact_Address = txt_org_addr1.Text;
            contact.Address2 = txt_org_addr2.Text;
            contact.Contact_No = txt_org_tel.Text;
            contact.Email = txt_email.Text;
            contact.Remark = txt_remark.Text;
            bL_Contact.update_Usefull_Contact_Details(contact);

        }



        public void runproc(string operation)
        {
            if (usefull_contact_id.Value != "")
                contact.usefull_contact_id = Convert.ToInt32(usefull_contact_id.Value);
            contact.Sql_Operation = operation;
            var result = bL_Contact.update_Usefull_Contact_Details(contact);

            usefull_contact_id.Value = result.usefull_contact_id.ToString();
            society_id.Value = result.Society_Id;
            txt_p_name.Text = result.P_Name;
            contact_type_id.Value = result.P_Type.ToString();
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
            ClientScript.RegisterStartupScript(this.GetType(), "Pop", "SuccessEntry();", true);
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {

            if (usefull_contact_id.Value != "")
                contact.usefull_contact_id = Convert.ToInt32(usefull_contact_id.Value.ToString());
            contact.Sql_Operation = "Delete";
            bL_Contact.delete(contact);

            Response.Redirect("usefull_contact.aspx");

        }

        protected void btn_close_Click(object sender, EventArgs e)
        {
            Response.Redirect("contact_master.aspx");
        }

        protected void drp_per_type_SelectedIndexChanged(object sender, EventArgs e)
        {
           // if (drp_per_type.SelectedItem.Text != "select")
            {
                if (usefull_contact_id.Value != "")
                    contact.usefull_contact_id = Convert.ToInt32(usefull_contact_id.Value);
                contact.Sql_Operation = "p_name_already_exist";
                contact.P_Name = txt_p_name.Text;
                contact.P_Type = Convert.ToInt32(contact_type_id.Value.ToString());
                var result = bL_Contact.Per_Type_SelectIndexChanged(contact);

                Label10.Text = result.Sql_Result;

                if (Label10.Text != "")
                    btn_save.Enabled = false;
                else
                    btn_save.Enabled = true;

            }
        }
        


        protected void gvbind1()
        {
               
                contact.Sql_Operation = "Grid_Show";
                contact.Society_Id = society_id.Value;
                contact.P_Type = 2;
                var dt = bL_Contact.GetContactDetails_1(contact);
            GridView1.DataSource = dt;
                GridView1.DataBind();

        }
        protected void gvbind2()
        {
            contact.Sql_Operation = "Grid_Show";
            contact.Society_Id = society_id.Value;
            contact.P_Type = 1;
            var dt = bL_Contact.GetContactDetails_2(contact);
            GridView2.DataSource = dt;
            GridView2.DataBind();



        }
        protected void gvbind3()
        {
            contact.Sql_Operation = "Grid_Show";
            contact.Society_Id = society_id.Value;
            contact.P_Type = 6;
            var dt = bL_Contact.GetContactDetails_3(contact);
            GridView8.DataSource = dt;
            GridView8.DataBind();



        }
        protected void gvbind4()
        {
            contact.Sql_Operation = "Grid_Show";
            contact.Society_Id = society_id.Value;
            contact.P_Type = 4;
            var dt = bL_Contact.GetContactDetails_4(contact);
            GridView4.DataSource = dt;
            GridView4.DataBind();

           
        }
        protected void gvbind5()
        {
            contact.Sql_Operation = "Grid_Show";
            contact.Society_Id = society_id.Value;
            contact.P_Type = 5;
            var dt = bL_Contact.GetContactDetails_5(contact);
            GridView5.DataSource = dt;
            GridView5.DataBind();


         
        }
        protected void gvbind6()
        {
            contact.Sql_Operation = "Grid_Show";
            contact.Society_Id = society_id.Value;
            contact.P_Type = 9;
          
            var dt = bL_Contact.GetContactDetails_6(contact);
            GridView6.DataSource = dt;
            GridView6.DataBind();


        }
        protected void gvbind7()
        {
            contact.Sql_Operation = "Grid_Show";
            contact.Society_Id = society_id.Value;
            contact.P_Type = 3;
            var dt = bL_Contact.GetContactDetails_7(contact);
            GridView7.DataSource = dt;
            GridView7.DataBind();

        }
        protected void gvbind8()
        {

            contact.Sql_Operation = "Grid_Show";
            contact.Society_Id = society_id.Value;
            contact.P_Type = 8;
            var dt  = bL_Contact.GetContactDetails_8(contact);
            GridView3.DataSource = dt;
            GridView3.DataBind();


        }
        protected void gvbind9()
        {
            contact.Sql_Operation = "Grid_Show";
            contact.Society_Id = society_id.Value;
            contact.P_Type = 7;
            var dt  = bL_Contact.GetContactDetails_9(contact);
            GridView9.DataSource = dt;
            GridView9.DataBind();


        }
        protected void gvbind10()
        {
            contact.Sql_Operation = "Grid_Show";
            contact.Society_Id = society_id.Value;
            contact.P_Type = 10;
            var dt  = bL_Contact.GetContactDetails_10(contact);
            GridView10.DataSource = dt;
            GridView10.DataBind();


        }
        protected void gvbind11()
        {
            contact.Sql_Operation = "Grid_Show";
            contact.Society_Id = society_id.Value;
            contact.P_Type = 11;
            var dt  = bL_Contact.GetContactDetails_11(contact);
            GridView11.DataSource = dt;
            GridView11.DataBind();

        }

        protected void btn_print_Click(object sender, EventArgs e)
        {
            Response.Redirect("printcontact.aspx");
        }
    }
}


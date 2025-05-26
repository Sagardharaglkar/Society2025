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

namespace Society
{
    public partial class contact_master : Page
    {

        usefull_Contact contact = new usefull_Contact();
        BL_Contact_Master bL_Contact = new BL_Contact_Master();


      
      

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }
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
                if (Request.QueryString["v_id"] != null)
                {

                }
            }
        }




        protected void gvbind1()
        {
               
                contact.Sql_Operation = "Grid_Show";
                contact.Society_Id = society_id.Value;
                contact.P_Type = 2;
                var dt = bL_Contact.GetContactDetails_1(contact);
                GridView1.DataSource = dt.Tables[0];
                GridView1.DataBind();

        }
        protected void gvbind2()
        {
            contact.Sql_Operation = "Grid_Show";
            contact.Society_Id = society_id.Value;
            contact.P_Type = 1;
            var dt = bL_Contact.GetContactDetails_2(contact);
            GridView2.DataSource = dt.Tables[0];
            GridView2.DataBind();



        }
        protected void gvbind3()
        {
            contact.Sql_Operation = "Grid_Show";
            contact.Society_Id = society_id.Value;
            contact.P_Type = 6;
            var dt = bL_Contact.GetContactDetails_3(contact);
            GridView8.DataSource = dt.Tables[0];
            GridView8.DataBind();



        }
        protected void gvbind4()
        {
            contact.Sql_Operation = "Grid_Show";
            contact.Society_Id = society_id.Value;
            contact.P_Type = 4;
            var dt = bL_Contact.GetContactDetails_4(contact);
            GridView4.DataSource = dt.Tables[0];
            GridView4.DataBind();

           
        }
        protected void gvbind5()
        {
            contact.Sql_Operation = "Grid_Show";
            contact.Society_Id = society_id.Value;
            contact.P_Type = 5;
            var dt = bL_Contact.GetContactDetails_5(contact);
            GridView5.DataSource = dt.Tables[0];
            GridView5.DataBind();


         
        }
        protected void gvbind6()
        {
            contact.Sql_Operation = "Grid_Show";
            contact.Society_Id = society_id.Value;
            contact.P_Type = 9;
          
            var dt = bL_Contact.GetContactDetails_6(contact);
            GridView6.DataSource = dt.Tables[0];
            GridView6.DataBind();


        }
        protected void gvbind7()
        {
            contact.Sql_Operation = "Grid_Show";
            contact.Society_Id = society_id.Value;
            contact.P_Type = 3;
            var dt = bL_Contact.GetContactDetails_7(contact);
            GridView7.DataSource = dt.Tables[0];
            GridView7.DataBind();

        }
        protected void gvbind8()
        {

            contact.Sql_Operation = "Grid_Show";
            contact.Society_Id = society_id.Value;
            contact.P_Type = 8;
            var dt  = bL_Contact.GetContactDetails_8(contact);
            GridView3.DataSource = dt.Tables[0];
            GridView3.DataBind();


        }
        protected void gvbind9()
        {
            contact.Sql_Operation = "Grid_Show";
            contact.Society_Id = society_id.Value;
            contact.P_Type = 7;
            var dt  = bL_Contact.GetContactDetails_9(contact);
            GridView9.DataSource = dt.Tables[0];
            GridView9.DataBind();


        }
        protected void gvbind10()
        {
            contact.Sql_Operation = "Grid_Show";
            contact.Society_Id = society_id.Value;
            contact.P_Type = 10;
            var dt  = bL_Contact.GetContactDetails_10(contact);
            GridView10.DataSource = dt.Tables[0];
            GridView10.DataBind();


        }
        protected void gvbind11()
        {
            contact.Sql_Operation = "Grid_Show";
            contact.Society_Id = society_id.Value;
            contact.P_Type = 11;
            var dt  = bL_Contact.GetContactDetails_11(contact);
            GridView11.DataSource = dt.Tables[0];
            GridView11.DataBind();

        }

        protected void btn_print_Click(object sender, EventArgs e)
        {
            Response.Redirect("printcontact.aspx");
        }
    }
}


using Society;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Utility.DataClass;

namespace DataAccessLayer.DA
{
    public class DA_Usefull_Contact
    {
        stored st = new stored();

        public void fill_drop(DropDownList drp_down, string sqlstring, string text, string value)
        {
            st.fill_drop(drp_down, sqlstring, text, value);
        }

        public DataSet get_usefull_contact(string society)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", "Grid_Show"));
            data_item.Add(st.create_array("society_id", society));

            status1 = st.run_query(data_item, "Select", "sp_Caretaker_master", ref sdr);

            if (status1 == "Done")
                dt.Load(sdr);
            ds.Tables.Add(dt);
            return ds;
        }


        public usefull_Contact Update_Contact_Details(usefull_Contact contact)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";
            data_item.Add(st.create_array("operation", contact.Sql_Operation));
            data_item.Add(st.create_array("usefull_contact_id", contact.usefull_contact_id));
            if (contact.Sql_Operation == "Update")
            {
                data_item.Add(st.create_array("society_id", contact.Society_Id));
                data_item.Add(st.create_array("p_name", contact.P_Name));
                data_item.Add(st.create_array("p_type", contact.P_Type));
                data_item.Add(st.create_array("org_name", contact.Org_Name));
                data_item.Add(st.create_array("contact_address", contact.Contact_Address));
                data_item.Add(st.create_array("address2", contact.Address2));
                data_item.Add(st.create_array("contact_no", contact.Contact_No));
                data_item.Add(st.create_array("email", contact.Email));
                data_item.Add(st.create_array("remark", contact.Remark));

            }
            status1 = st.run_query(data_item, "Select", "sp_usefull_contact", ref sdr);

            if (status1 == "Done")
            {
                if (contact.Sql_Operation == "Select")
                {
                    while (sdr.Read())
                    {
                        //evt.Event_Id = Convert.ToInt32(sdr["event_id"].ToString());
                        contact.Society_Id = sdr["society_id"].ToString();
                        contact.P_Name = sdr["p_name"].ToString();
                        contact.P_Type = Convert.ToInt32(sdr["p_type"].ToString());
                        contact.Org_Name = sdr["org_name"].ToString();
                        contact.Contact_Address = sdr["contact_address"].ToString();
                        contact.Address2 = sdr["address2"].ToString();
                        contact.Contact_No = sdr["contact_no"].ToString();
                        contact.Email = sdr["email"].ToString();
                        contact.Remark = sdr["remark"].ToString();

                    }
                }
                else
                {
                    contact.Sql_Result = status1;
                }

            }
            return contact;




        //    ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
        //    SqlDataReader sdr = null;
        //    string status = "";
        //    data_item.Add(st.create_array("operation", operation));
        //    data_item.Add(st.create_array("id", id.Value == null ? (object)DBNull.Value : id.Value));
        //    if (operation == "Update")
        //    {
        //        data_item.Add(st.create_array("society_id", society_id.Value == null ? (object)DBNull.Value : society_id.Value));
        //        data_item.Add(st.create_array("p_name", string.IsNullOrWhiteSpace(txt_p_name.Text) ? (object)DBNull.Value : txt_p_name.Text));
        //        data_item.Add(st.create_array("p_type", string.IsNullOrWhiteSpace(drp_per_type.SelectedValue) ? (object)DBNull.Value : drp_per_type.SelectedValue));
        //        data_item.Add(st.create_array("org_name", string.IsNullOrWhiteSpace(txt_org_name.Text) ? (object)DBNull.Value : txt_org_name.Text));
        //        data_item.Add(st.create_array("contact_address", string.IsNullOrWhiteSpace(txt_org_addr1.Text) ? (object)DBNull.Value : txt_org_addr1.Text));
        //        data_item.Add(st.create_array("address2", string.IsNullOrWhiteSpace(txt_org_addr2.Text) ? (object)DBNull.Value : txt_org_addr2.Text));
        //        data_item.Add(st.create_array("contact_no", string.IsNullOrWhiteSpace(txt_org_tel.Text) ? (object)DBNull.Value : txt_org_tel.Text));
        //        data_item.Add(st.create_array("email", string.IsNullOrWhiteSpace(txt_email.Text) ? (object)DBNull.Value : txt_email.Text));
        //        data_item.Add(st.create_array("remark", string.IsNullOrWhiteSpace(txt_remark.Text) ? (object)DBNull.Value : txt_remark.Text));

        //    }
        //    status = st.run_query(data_item, operation, "sp_usefull_contact", ref sdr);
        //    if (status == "Done")
        //    {
        //        if (operation == "Select")
        //        {
        //            while (sdr.Read())
        //            {
        //                txt_p_name.Text = sdr["p_name"].ToString();
        //                drp_per_type.SelectedValue = sdr["p_type"].ToString();
        //                txt_org_name.Text = sdr["org_name"].ToString();
        //                txt_org_addr1.Text = sdr["contact_address"].ToString();
        //                txt_org_addr2.Text = sdr["address2"].ToString();
        //                txt_org_tel.Text = sdr["contact_no"].ToString();
        //                txt_email.Text = sdr["email"].ToString();
        //                txt_remark.Text = sdr["remark"].ToString();
        //            }
        //        }
        //    }

        }

        public DataTable usefull_contact_search(usefull_Contact usefull)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";

            DataTable dt = new DataTable();
            data_item.Add(st.create_array("query", usefull.Sql_Operation));

            status1 = st.run_query(data_item, "Select", "sp_search", ref sdr);

            if (status1 == "Done")
                dt.Load(sdr);
            return dt;
        }

        public usefull_Contact Delete_Contact(usefull_Contact contact)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status = "";
            data_item.Add(st.create_array("operation", contact.Sql_Operation));
            data_item.Add(st.create_array("usefull_contact_id", contact.usefull_contact_id));

            status = st.run_query(data_item, "Delete", "sp_usefull_contact", ref sdr);
            if (status == "Done")
            {
                contact.Sql_Result = status;
            }
            return contact;
        }

        public usefull_Contact per_type_selectIndexChanged(usefull_Contact contact)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;

            string status1 = "";

            data_item.Add(st.create_array("operation", contact.Sql_Operation));
            data_item.Add(st.create_array("usefull_contact_id", contact.usefull_contact_id));
            data_item.Add(st.create_array("p_name", contact.P_Name));
            data_item.Add(st.create_array("p_type", contact.P_Type));
            status1 = st.run_query(data_item, "Select", "sp_usefull_contact", ref sdr);

            if (status1 == "Done")
                if (sdr.Read())
                    contact.Sql_Result = "Already exist";
                else
                    contact.Sql_Result = "";
            return contact;

            }
        }
    }

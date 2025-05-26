using Society;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Utility.DataClass;

namespace DataAccessLayer.DA
{
    public class DA_Contact_Master
    {
        stored st = new stored();
        public DataSet get_contact_details_1(usefull_Contact contact)
        {
                ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
                SqlDataReader sdr = null;
                string status1 = "";
                DataSet ds = new DataSet();
                DataTable dt = new DataTable();
                data_item.Add(st.create_array("operation",contact.Sql_Operation));
                data_item.Add(st.create_array("society_id", contact.Society_Id));
                data_item.Add(st.create_array("p_type", contact.P_Type));

            status1 = st.run_query(data_item, "Select", "sp_contact", ref sdr);

                if (status1 == "Done")
                    dt.Load(sdr);
                ds.Tables.Add(dt);
                return ds;
           
        }

      
        public DataSet get_contact_details_2(usefull_Contact contact)
        {

            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", contact.Sql_Operation));
            data_item.Add(st.create_array("society_id", contact.Society_Id));
            data_item.Add(st.create_array("p_type", contact.P_Type));

            status1 = st.run_query(data_item, "Select", "sp_contact", ref sdr);

            if (status1 == "Done")
                dt.Load(sdr);
            ds.Tables.Add(dt);
            return ds;
        }

        public DataSet get_contact_details_3(usefull_Contact contact)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", contact.Sql_Operation));
            data_item.Add(st.create_array("society_id", contact.Society_Id));
            data_item.Add(st.create_array("p_type", contact.P_Type));

            status1 = st.run_query(data_item, "Select", "sp_contact", ref sdr);

            if (status1 == "Done")
                dt.Load(sdr);
            ds.Tables.Add(dt);
            return ds;
        }

        public DataSet get_contact_details_4(usefull_Contact contact)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", contact.Sql_Operation));
            data_item.Add(st.create_array("society_id", contact.Society_Id));
            data_item.Add(st.create_array("p_type", contact.P_Type));

            status1 = st.run_query(data_item, "Select", "sp_contact", ref sdr);

            if (status1 == "Done")
                dt.Load(sdr);
            ds.Tables.Add(dt);
            return ds;
        }
        public DataSet get_contact_details_5(usefull_Contact contact)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", contact.Sql_Operation));
            data_item.Add(st.create_array("society_id", contact.Society_Id));
            data_item.Add(st.create_array("p_type", contact.P_Type));

            status1 = st.run_query(data_item, "Select", "sp_contact", ref sdr);

            if (status1 == "Done")
                dt.Load(sdr);
            ds.Tables.Add(dt);
            return ds;
        }

        public DataSet get_contact_details_6(usefull_Contact contact)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", contact.Sql_Operation));
            data_item.Add(st.create_array("society_id", contact.Society_Id));
            data_item.Add(st.create_array("p_type", contact.P_Type));

            status1 = st.run_query(data_item, "Select", "sp_contact", ref sdr);

            if (status1 == "Done")
                dt.Load(sdr);
            ds.Tables.Add(dt);
            return ds;
        }

        public DataSet get_contact_details_7(usefull_Contact contact)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", contact.Sql_Operation));
            data_item.Add(st.create_array("society_id", contact.Society_Id));
            data_item.Add(st.create_array("p_type", contact.P_Type));

            status1 = st.run_query(data_item, "Select", "sp_contact", ref sdr);

            if (status1 == "Done")
                dt.Load(sdr);
            ds.Tables.Add(dt);
            return ds;
        }

        public DataSet get_contact_details_8(usefull_Contact contact)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", contact.Sql_Operation));
            data_item.Add(st.create_array("society_id", contact.Society_Id));
            data_item.Add(st.create_array("p_type", contact.P_Type));

            status1 = st.run_query(data_item, "Select", "sp_contact", ref sdr);

            if (status1 == "Done")
                dt.Load(sdr);
            ds.Tables.Add(dt);
            return ds;
        }

        public DataSet get_contact_details_9(usefull_Contact contact)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", contact.Sql_Operation));
            data_item.Add(st.create_array("society_id", contact.Society_Id));
            data_item.Add(st.create_array("p_type", contact.P_Type));

            status1 = st.run_query(data_item, "Select", "sp_contact", ref sdr);

            if (status1 == "Done")
                dt.Load(sdr);
            ds.Tables.Add(dt);
            return ds;
        }

        public DataSet get_contact_details_10(usefull_Contact contact)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", contact.Sql_Operation));
            data_item.Add(st.create_array("society_id", contact.Society_Id));
            data_item.Add(st.create_array("p_type", contact.P_Type));

            status1 = st.run_query(data_item, "Select", "sp_contact", ref sdr);

            if (status1 == "Done")
                dt.Load(sdr);
            ds.Tables.Add(dt);
            return ds;
        }

        public DataSet get_contact_details_11(usefull_Contact contact)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", contact.Sql_Operation));
            data_item.Add(st.create_array("society_id", contact.Society_Id));
            data_item.Add(st.create_array("p_type", contact.P_Type));

            status1 = st.run_query(data_item, "Select", "sp_contact", ref sdr);

            if (status1 == "Done")
                dt.Load(sdr);
            ds.Tables.Add(dt);
            return ds;
        }
    }
}
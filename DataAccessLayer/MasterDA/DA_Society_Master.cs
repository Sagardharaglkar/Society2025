using DBCode.DataClass.Master_Dataclass;
using Society;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace DataAccessLayer.MasterDA
{
    public class DA_Society_Master
    {
        stored st = new stored();
        public DataSet getCharge(Search_Society society)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", "Grid_Show"));
            status1 = st.run_query(data_item, "Select", "sp_society_charges", ref sdr);

            if (status1 == "Done")
                dt.Load(sdr);
            ds.Tables.Add(dt);
            return ds;
        }
        public Search_Society updateSocietyDetails(Search_Society society)
          {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr1 = null;
           
            string status1 = "";
            data_item.Add(st.create_array("operation", society.Sql_Operation));
            data_item.Add(st.create_array("society_master_id", society.society_master_id));
            if (society.Sql_Operation == "Update")
            {
                data_item.Add(st.create_array("society_id", society.Society_Id));
                data_item.Add(st.create_array("name", society.Name));
                data_item.Add(st.create_array("establish_date", society.Establish_Date));
                data_item.Add(st.create_array("registration_no", society.Registration_No));
                data_item.Add(st.create_array("off_address1", society.Off_Address1));
                data_item.Add(st.create_array("off_address2", society.Off_Address2));
                data_item.Add(st.create_array("contact_no1", society.Contact_No1));
                data_item.Add(st.create_array("email", society.Email));
                data_item.Add(st.create_array("city", society.City));
                data_item.Add(st.create_array("state_id", society.State_Id));
                data_item.Add(st.create_array("pincode", society.Pincode));
                data_item.Add(st.create_array("home_no", society.Home_No));
                data_item.Add(st.create_array("division_id", society.Division));
                data_item.Add(st.create_array("district_id", society.District_Id));
                data_item.Add(st.create_array("tan_no", society.Tan_No));
                data_item.Add(st.create_array("gstin_no", society.Gstin_No));
                data_item.Add(st.create_array("pan_no", society.Pan_No));

            }
            status1 = st.run_query(data_item, "Select", "sp_society_master", ref sdr1);
            if (status1 == "Done")
                if (sdr1.Read())
                {
                    society.Society_Id = sdr1["society_id"].ToString();
                    society.Name = sdr1["name"].ToString();
                    society.Establish_Date = Convert.ToDateTime(sdr1["establish_date"].ToString());
                    society.Registration_No = sdr1["registration_no"].ToString();
                    society.Off_Address1 = sdr1["off_address1"].ToString();
                    society.Off_Address2 = sdr1["off_address2"].ToString();
                    society.Contact_No1 = sdr1["contact_no1"].ToString();
                    society.Email = sdr1["email"].ToString();
                    society.City = sdr1["city"].ToString();
                    society.State_Id = Convert.ToInt32(sdr1["state_id"].ToString());
                    society.Pincode = sdr1["pincode"].ToString();
                    society.Home_No = Convert.ToInt32(sdr1["home_no"].ToString());
                    society.Division = sdr1["division_id"].ToString();
                    society.District_Id = Convert.ToInt32(sdr1["district_id"].ToString());
                    society.Tan_No = sdr1["tan_no"].ToString();
                    society.Gstin_No = sdr1["gstin_no"].ToString();
                    society.Pan_No = sdr1["pan_no"].ToString();
                }
            return society;

        }

        public Search_Society Check_society(Search_Society society)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";

            data_item.Add(st.create_array("operation", society.Sql_Operation));
            data_item.Add(st.create_array("charge_id", society.Charge_Id));
            data_item.Add(st.create_array("society_id", society.Society_Id));
           
            status1 = st.run_query(data_item, "Select", "sp_society_charges", ref sdr);
            if (status1 == "Done")
                if (sdr.Read())
                    society.Sql_Result = "Already exist";
                else
                    society.Sql_Result = "";

            return society;
        }

        public Search_Society Delete_Charge(Search_Society society)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status = "";
            data_item.Add(st.create_array("operation", society.Sql_Operation));
            data_item.Add(st.create_array("charge_id", society.Charge_Id));

            status = st.run_query(data_item, "Delete", "sp_society_charges", ref sdr);
            if (status == "Done")
            {
                society.Sql_Result = status;
            }
            return society;
        }

        public DataSet Get_Society_Details(string society)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", "Grid_Show"));
            data_item.Add(st.create_array("society_id", society));


            status1 = st.run_query(data_item, "Select", "sp_society_master", ref sdr);

            if (status1 == "Done")
                dt.Load(sdr);
            ds.Tables.Add(dt);
            return ds;
        }

        public Search_Society Update_Charges(Search_Society society)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1;
            data_item.Add(st.create_array("operation", society.Sql_Operation));
            data_item.Add(st.create_array("charge_id", society.Charge_Id));
            if (society.Sql_Operation == "Update")
            {
                data_item.Add(st.create_array("society_id", society.Society_Id));
              
                data_item.Add(st.create_array("amount", society.Amount));
            }
            status1 = st.run_query(data_item, "Select", "sp_society_charges", ref sdr);
            if (status1 == "Done")
            {
                if (society.Sql_Operation == "Select")
                {
                    while (sdr.Read())
                    {
                        //  build_id.Value = sdr["build_id"].ToString();
                        society.Charge_Id = Convert.ToInt32(sdr["charge_id"].ToString());
                        society.Society_Id = sdr["society_id"].ToString();
                        society.Amount = sdr["amount"].ToString();
                    }
                }
            }
            return society;
        }

        public DataTable society_search(Search_Society society)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";
            
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("query", society.Sql_Operation));
            
            
            status1 = st.run_query(data_item, "Select", "sp_search", ref sdr);

            if (status1 == "Done")
                if(sdr.Read())
                    dt.Load(sdr);
                    return dt;

        }

        public DataTable support_ticket(Search_Society society)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";

            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", society.Sql_Operation));
            data_item.Add(st.create_array("society_id", society.Society_Id));

            status1 = st.run_query(data_item, "Select", "sp_society_master", ref sdr);

            if (status1 == "Done")
                if (sdr.HasRows)
                    dt.Load(sdr);
            return dt;
        }

        public Search_Society delete_society(Search_Society society)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status = "";
            data_item.Add(st.create_array("operation", society.Sql_Operation));
            //data_item.Add(st.create_array("society_id", society.Society_Id));
            data_item.Add(st.create_array("society_master_id", society.society_master_id));

            status = st.run_query(data_item, "Delete", "sp_society_master", ref sdr);
            if (status == "Done")
            {
                society.Sql_Result = status;
            }
            return society;
        }

        public Search_Society SelectTextChanged(Search_Society society)
        {

            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";

            data_item.Add(st.create_array("operation",society.Sql_Operation));
            data_item.Add(st.create_array("society_master_id", society.society_master_id));
            data_item.Add(st.create_array("name", society.Name));
            data_item.Add(st.create_array("registration_no", society.Registration_No));
            status1 = st.run_query(data_item, "Select", "sp_society_master", ref sdr);
            if (status1 == "Done")
                if (sdr.Read())
                    society.Sql_Result = "Already exist";
                else
                    society.Sql_Result = "";
           
            return society;

        }
   
    
    }
}
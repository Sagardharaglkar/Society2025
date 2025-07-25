﻿using DBCode.DataClass.Master_Dataclass;
using Society;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace DataAccessLayer.DA
{
    public class DA_Parking_Allotment
    {
        stored st = new stored();
        public void fill_drop(DropDownList drp_down, string sqlstring, string text, string value)
        {
            st.fill_drop(drp_down, sqlstring, text, value);
        }
        public DataTable GetParkingAllotment(Parking parking)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";
            DataTable dt = new DataTable();
            data_item.Add(st.create_array("operation", parking.Sql_Operation));
            data_item.Add(st.create_array("society_id", parking.Society_Id));

            status1 = st.run_query(data_item, "Select", "sp_parking_master", ref sdr);

            if (status1 == "Done")
                if (sdr.HasRows)
                    dt.Load(sdr);
            return dt;
        }

        public Parking updateparkingallotment(Parking parking)
        {

            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";
            data_item.Add(st.create_array("operation", parking.Sql_Operation));
            data_item.Add(st.create_array("parking_id", parking.parking_id));
            if (parking.Sql_Operation == "Update")
            {
                data_item.Add(st.create_array("society_id", parking.Society_Id));
                data_item.Add(st.create_array("name", parking.Name));
                data_item.Add(st.create_array("park_for", parking.Park_For));
                data_item.Add(st.create_array("park_type", parking.Park_Type));
                data_item.Add(st.create_array("contact_no", parking.Contact_No));
                data_item.Add(st.create_array("vehicle_no", parking.Vehicle_No));
                data_item.Add(st.create_array("place_id", parking.place_id));

            }
            status1 = st.run_query(data_item, "Select", "sp_parking_master", ref sdr);

            if (status1 == "Done")
            {
                if (parking.Sql_Operation == "Select")
                {
                    while (sdr.Read())
                    {
                        //  facility_id.Value = sdr["facility_id"].ToString();
                        parking.Society_Id = sdr["society_id"].ToString();
                        parking.Name = sdr["name"].ToString();
                        parking.Park_For = sdr["park_for"].ToString();
                        parking.Park_Type = sdr["park_type"].ToString();
                        parking.Contact_No = sdr["contact_no"].ToString();
                        parking.Vehicle_No = sdr["vehicle_no"].ToString();
                        parking.place_id = Convert.ToInt32(sdr["place_id"].ToString());

                    }
                }
                else
                {
                    parking.Sql_Result = status1;
                }
            }
            return parking;
        }

        public object parking_search(Parking parking)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status1 = "";

            DataTable dt = new DataTable();
            data_item.Add(st.create_array("Operation", parking.Sql_Operation));
            data_item.Add(st.create_array("search", parking.Name));
            data_item.Add(st.create_array("society_id", parking.Society_Id));

            status1 = st.run_query(data_item, "Select", "sp_parking_master", ref sdr);

            if (status1 == "Done")
                if (sdr.HasRows)
                    dt.Load(sdr);
            return dt;
        }

        public Parking delete(Parking parking)
        {

            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;
            string status = "";
            data_item.Add(st.create_array("operation", parking.Sql_Operation));
            data_item.Add(st.create_array("parking_id", parking.parking_id));

            status = st.run_query(data_item, "Delete", "sp_parking_master", ref sdr);
            if (status == "Done")
            {
                parking.Sql_Result = status;
            }
            return parking;


        }

        public Parking vehicle_no_textchanged(Parking parking)
        {
            ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
            SqlDataReader sdr = null;

            string status1 = "";

            data_item.Add(st.create_array("operation", parking.Sql_Operation));
            data_item.Add(st.create_array("vehicle_no", parking.Vehicle_No));
            data_item.Add(st.create_array("parking_id", parking.parking_id));
            status1 = st.run_query(data_item, "Select", "sp_parking_master", ref sdr);

            if (status1 == "Done")
                if (sdr.Read())
                    parking.Sql_Result = "Already exist";
                else
                    parking.Sql_Result = "";
            return parking;
        }
    }
}
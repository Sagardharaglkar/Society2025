using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DBCode.DataClass.Master_Dataclass
{
    public class Village
    {
        private string name;
        private int contact_no;
        private string email;
        private string village_id;
        private int state_id;
        private int pincode;
        private int district_id;
        private string taluka;
        private DateTime enrolment_date;
        private DateTime termination_date;
        private string Operation;
        private string Result;


        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        public int Contact_No
        {
            get { return contact_no; }
            set { contact_no = value; }
        }
        public string Email
        {
            get { return email; }
            set { email = value; }
        }

        public string Village_Id
        {
            get { return village_id; }
            set { village_id = value; }
        }
        public int State_Id
        {
            get { return state_id; }
            set { state_id = value; }
        }

        public int PinCode
        {
            get { return pincode; }
            set { pincode = value; }
        }

        public int District_Id
        {
            get { return district_id; }
            set { contact_no = value; }
        }

        public string Taluka
        {
            get { return taluka; }
            set { taluka = value; }
        }

        public DateTime Enrolment_Date
        {
            get { return enrolment_date; }
            set { enrolment_date = value; }
        }

        public DateTime Termination_Date
        {
            get { return termination_date; }
            set { termination_date = value; }
        }


        public string Sql_Operation
        {
            get { return Operation; }
            set { Operation = value; }
        }
        public string Sql_Result
        {
            get { return Result; }
            set { Result = value; }
        }


    }
}
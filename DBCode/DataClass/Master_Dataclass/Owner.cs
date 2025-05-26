using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DBCode.DataClass
{
    public class Owner
    {
        private int oid;
        private string societyid;
        private string type;
        private DateTime possdate;
        private string name;
        private string w_name;
        private string preaddr1;
        private string preadd2;
        private string premob;
        private string altermob;
        private string email;
        private int age;
        private int marriedid;
        private int ftid;
        private DateTime dob;
        private int fid;
        private string occup;
        private string monthlyincome;
        private string offaddr1;
        private string offaddr2;
        private string offtel;
        private string idproof;
        private string photoname;
        private int wid;
        private DateTime aggrementdate;
        private DateTime aggrementperiodfrom;
        private DateTime aggrementperiodto;
        private DateTime policeverificationdate;
        private string flatno;
        private string Operation;
        private string Result;


        //runproc_F

        private int oexid;
        private string fname;
        private string relation;
        private string foccu;
        private string fdob;


    public int owner_id
        {
            get { return oid; }
            set { oid = value; }
        }
        public string Society_Id
        {
            get { return societyid; }
            set { societyid = value; }
        }
        public string Type
        {
            get { return type; }
            set { type = value; }
        }
        public DateTime Poss_Date
        {
            get { return possdate; }
            set { possdate = value; }
        }
        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        public string W_Name
        {
            get { return w_name; }
            set { w_name = value; }
        }
        public string Pre_Addr1
        {
            get { return preaddr1; }
            set { preaddr1 = value; }
        }
        public string Pre_Addr2
        {
            get { return preadd2; }
            set { preadd2 = value; }
        }
        public string Pre_Mob
        {
            get { return premob; }
            set { premob = value; }
        }
        public string Alter_Mob
        {
            get { return altermob; }
            set { altermob = value; }
        }
        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        public int Age
        {
            get { return age; }
            set { age = value; }
        }
        public int married_id
        {
            get { return marriedid; }
            set { marriedid = value; }
        }
        public int Flat_type_Id
        {
            get { return ftid; }
            set { ftid = value; }
        }
        public DateTime Dob
        {
            get { return dob; }
            set { dob = value; }
        }
        public int flat_id
        {
            get { return fid; }
            set { fid = value; }
        }
        public string Occup
        {
            get { return occup; }
            set { occup = value; }
        }
        public string Monthly_Income
        {
            get { return monthlyincome; }
            set { monthlyincome = value; }
        }
        public string Off_Addr1
        {
            get { return offaddr1; }
            set { offaddr1 = value; }
        }
        public string Off_Addr2
        {
            get { return offaddr2; }
            set { offaddr2 = value; }
        }
        public string Off_Tel
        {
            get { return offtel; }
            set { offtel = value; }
        }
        public string Id_Proof
        {
            get { return idproof; }
            set { idproof = value; }
        }
        public string Photo_Name
        {
            get { return photoname; }
            set { photoname = value; }
        }
        public int wing_id
        {
            get { return wid; }
            set { wid = value; }
        }
        public DateTime Aggrement_Date
        {
            get { return aggrementdate; }
            set { aggrementdate = value; }
        }
        public DateTime Aggrement_Period_From
        {
            get { return aggrementperiodfrom; }
            set { aggrementperiodfrom = value; }
        }
             public DateTime Aggrement_Period_To
        {
            get { return aggrementperiodto; }
            set { aggrementperiodto = value; }
        }
        public DateTime Police_Verification_Date
        
        {
            get { return policeverificationdate; }
            set { policeverificationdate = value; }
        }
        public string Flat_No
        {
            get { return flatno; }
            set { flatno = value; }
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


        //runproc F

        public int O_Ex_Id
        {
            get { return oexid; }
            set { oexid = value; }
        }
        public string F_Name
        {
            get { return fname; }
            set { fname = value; }
        }
        public string Relation
        {
            get { return relation; }
            set { relation = value; }
        }
        public string F_Occu
        {
            get { return foccu; }
            set { foccu = value; }
        }
        public string F_Dob
        {
            get { return fdob; }
            set { fdob = value; }
        }

    }
}

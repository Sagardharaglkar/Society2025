using DataAccessLayer.MasterDA;
using DBCode.DataClass.Master_Dataclass;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace BusinessLogic.MasterBL
{
    public class BL_Society_Member_Master
    {
        DA_Society_Member_Master dA_Society_Member = new DA_Society_Member_Master();
        public DataSet getSocietyMemberDetails(Society_Member member)
        {
           
            DataSet society_member_master = dA_Society_Member.getSocietyMemberDetails(member);
            return society_member_master;
        }
        public DataSet add_approver(Society_Member member)
        {

             return dA_Society_Member.Add_Approver(member);
            
        }
        public void fill_drop(DropDownList drp_down, string sqlstring, string text, string value)
        {
            dA_Society_Member.fill_drop(drp_down, sqlstring, text, value);
        }
        public Society_Member updateSocietyMemberDetails(Society_Member member)
        {
           
             return dA_Society_Member.updateSocietyMemberDetails(member);
         
        }

        public Society_Member delete(Society_Member member)
        {
           
            return dA_Society_Member.delete(member);


        }

        public Society_Member SocietyMemberTextChange(Society_Member member)
        {
            
            return dA_Society_Member.SocietyMemberTextChange(member);
        }

        public object search_member(Society_Member member)
        {
           
            return dA_Society_Member.search_member(member);
        }
    }
}
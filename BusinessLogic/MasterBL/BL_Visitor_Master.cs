using DataAccessLayer.MasterDA;
using DBCode.DataClass.Master_Dataclass;
using System;
using System.Collections.Generic;
using System.Data;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace BusinessLogic.MasterBL
{
    public class BL_Visitor_Master
    {

        DA_Visitor_Master DA_Visitor = new DA_Visitor_Master();
        public DataTable getVisitorDetails(Visitor visitor)
        {
            DA_Visitor_Master dA_Visitor_= new DA_Visitor_Master();
            DataTable visitor_data = dA_Visitor_.getVisitorDetails(visitor);
            return visitor_data;

        }
        public Visitor updateVisitorDetails(Visitor visitor)
        {
            DA_Visitor_Master dA_Visitor_ = new DA_Visitor_Master();
            return dA_Visitor_.UpdateVisitorDetails(visitor);

        }
        public Visitor deletevisitor(Visitor visitor)
        {
            DA_Visitor_Master dA_Visitor_ = new DA_Visitor_Master();
            return dA_Visitor_.delete_visitor(visitor);

        }
      
        public void fill_drop(DropDownList drp_down, string sqlstring, string text, string value)
        {
            DA_Visitor.fill_drop(drp_down, sqlstring, text, value);
        }

        public object search_visitor(Visitor visitor)
        {
            DA_Visitor_Master dA_Visitor_ = new DA_Visitor_Master();
            return dA_Visitor_.search_visitor(visitor);
        }

        public DataTable get_printvisitor(Visitor visitor)
        {
            DA_Visitor_Master dA_Visitor_ = new DA_Visitor_Master();
            return dA_Visitor_.Get_PrintVisitor(visitor);
        }
    }
}
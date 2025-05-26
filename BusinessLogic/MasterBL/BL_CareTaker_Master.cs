using DataAccessLayer.MasterDA;
using DBCode.DataClass;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace BusinessLogic.MasterBL
{
    public class BL_CareTaker_Master
    {
        DA_CareTaker_Master DA_CareTaker = new DA_CareTaker_Master();
        public DataSet CareTakerDetails(string society_id)
        {
            DA_CareTaker_Master dA_Care = new DA_CareTaker_Master();
            DataSet caretaker_data = dA_Care.getCaretakerDetails(society_id);
            return caretaker_data;

        }
        public Caretaker updateCareTakerDetails(Caretaker care)
        {
            DA_CareTaker_Master dA_Care = new DA_CareTaker_Master();
            return dA_Care.updateCaretakerDetails(care);
        }
        public void fill_drop(DropDownList drp_down, string sqlstring, string text, string value)
        {
            DA_CareTaker.fill_drop(drp_down, sqlstring, text, value);
        }
        public Caretaker delete(Caretaker care)
        {
            DA_CareTaker_Master dA_Care = new DA_CareTaker_Master();
            return dA_Care.Delete_CareTaker(care);
        }

        public object search_caretaker(Caretaker care)
        {
            DA_CareTaker_Master dA_Care = new DA_CareTaker_Master();
            return dA_Care.caretaker_search(care);
        }
    }
}
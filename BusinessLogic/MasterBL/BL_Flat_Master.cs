using DataAccessLayer.MasterDA;
using DBCode.DataClass;
using Society;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace BusinessLogic.MasterBL
{
    public class BL_Flat_Master
    {
        DA_Flat_Master master = new DA_Flat_Master();
        DA_Flat_Master dA_Flat = new DA_Flat_Master();
        stored st = new stored();

        public void fill_drop(DropDownList drp_down, string sqlstring, string text, string value)
        {
            master.fill_drop(drp_down, sqlstring, text, value);
        }

        public DataSet getFlatDetails( string society)
        {

            DataSet flat_data = dA_Flat.getflatDetails(society);
            return flat_data;
        }
            public Flat updateFlatDetails( Flat flat)
            {
               
               return dA_Flat.updateflatDetails(flat);
            

            }

      
        public Flat FlatTextChange(Flat flat)
        {
           
            return dA_Flat.FlatTextChange(flat);
        }

        public Flat GetWing(Flat flat)
        {

            return dA_Flat.getwing(flat);
        }

        public Flat FlatDelete(Flat flat)
        {
          
            return dA_Flat.delete(flat);
        }

        public object search_flat(Flat flat)
        {
          
            return dA_Flat.search_flat(flat);
        }

       }
}

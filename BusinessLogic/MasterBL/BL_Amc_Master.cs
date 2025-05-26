using DataAccessLayer.MasterDA;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace BusinessLogic.MasterBL
{
    public class BL_Amc_Master
    {
        public DataSet getAmcDetails(int amc_id, string society_id)
        {
            DA_Amc_Master dA_Amc = new DA_Amc_Master();
            DataSet amc_data = dA_Amc.geAmcDetails(amc_id, society_id);
            return amc_data;
        }
        public void updateAmcDetails(DataSet amcmaster)
        {
            DA_Amc_Master dA_Amc = new DA_Amc_Master();
           dA_Amc.updateAmcDetails(amcmaster);


        }
    }
}
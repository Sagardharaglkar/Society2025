using DataAccessLayer.DA;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Utility.DataClass;

namespace BusinessLogic.BL
{
    public class BL_Upload_Doc
    {
        DA_Upload_Doc dA_Upload = new DA_Upload_Doc();
        public void fill_drop(DropDownList drp_down, string sqlstring, string text, string value)
        {
            dA_Upload.fill_drop(drp_down, sqlstring, text, value);
        }

        public DataTable GetUploadDoc(upload_doc doc)
        {
            return dA_Upload.get_upload_doc(doc);
        }

        public DataTable search_upload_doc(upload_doc doc)
        {
            return dA_Upload.upload_doc_serach(doc);
        }

        public upload_doc delete(upload_doc doc)
        {
            return dA_Upload.delete_upload_doc(doc);
        }

        public upload_doc updatedocsearch(upload_doc doc)
        {
            return dA_Upload.doc_search_update(doc);
        }

        public upload_doc flat_no_selectedIndexChanged(upload_doc doc)
        {
            return dA_Upload.Flat_No_SelectedIndexChanged(doc);
        }
    }
}
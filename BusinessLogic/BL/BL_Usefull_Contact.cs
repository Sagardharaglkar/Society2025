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
    public class BL_Usefull_Contact
    {
        DA_Usefull_Contact dA_Usefull_Contact = new DA_Usefull_Contact();

        public void fill_drop(DropDownList drp_down, string sqlstring, string text, string value)
        {
            dA_Usefull_Contact.fill_drop(drp_down, sqlstring, text, value);
        }

        public usefull_Contact update_Usefull_Contact_Details(usefull_Contact contact)
        {

            return dA_Usefull_Contact.Update_Contact_Details(contact);

        }

        public usefull_Contact delete(usefull_Contact contact)
        {
            return dA_Usefull_Contact.Delete_Contact(contact);
        }

        public usefull_Contact Per_Type_SelectIndexChanged(usefull_Contact contact)
        {
            return dA_Usefull_Contact.per_type_selectIndexChanged(contact);
        }

        public DataSet GetUsefullContact(string society_id)
        {
            return dA_Usefull_Contact.get_usefull_contact(society_id);
        }

        public DataTable search_usefull_contact(usefull_Contact usefull)
        {
            return dA_Usefull_Contact.usefull_contact_search(usefull);
        }
    }
}
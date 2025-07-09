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
    public class BL_Contact_Master
    {
        DA_Contact_Master dA_Contact = new DA_Contact_Master();
        public void fill_drop(DropDownList drp_down, string sqlstring, string text, string value)
        {
            dA_Contact.fill_drop(drp_down, sqlstring, text, value);
        }

        public usefull_Contact update_Usefull_Contact_Details(usefull_Contact contact)
        {

            return dA_Contact.Update_Contact_Details(contact);

        }

        public usefull_Contact delete(usefull_Contact contact)
        {
            return dA_Contact.Delete_Contact(contact);
        }

        public usefull_Contact Per_Type_SelectIndexChanged(usefull_Contact contact)
        {
            return dA_Contact.per_type_selectIndexChanged(contact);
        }

        public DataTable GetUsefullContact(string society_id)
        {
            return dA_Contact.get_usefull_contact(society_id);
        }

        public DataTable search_usefull_contact(usefull_Contact usefull)
        {
            return dA_Contact.usefull_contact_search(usefull);
        }
        public DataTable GetContactDetails_1(usefull_Contact contact)
        {
            return dA_Contact.get_contact_details_1(contact);
        }

        public DataTable GetContactDetails_2(usefull_Contact contact)
        {
            return dA_Contact.get_contact_details_2(contact);
        }

        public DataTable GetContactDetails_3(usefull_Contact contact)
        {
            return dA_Contact.get_contact_details_3(contact);
        }

        public DataTable GetContactDetails_4(usefull_Contact contact)
        {
            return dA_Contact.get_contact_details_4(contact);
        }
        public DataTable GetContactDetails_5(usefull_Contact contact)
        {
            return dA_Contact.get_contact_details_5(contact);
        }

        public DataTable GetContactDetails_6(usefull_Contact contact)
        {
            return dA_Contact.get_contact_details_6(contact);
        }

        public DataTable GetContactDetails_7(usefull_Contact contact)
        {
            return dA_Contact.get_contact_details_7(contact);
        }

        public DataTable GetContactDetails_8(usefull_Contact contact)
        {
            return dA_Contact.Get_contact_details_8(contact);
        }

        public DataTable GetContactDetails_9(usefull_Contact contact)
        {
            return dA_Contact.get_contact_details_9(contact);
        }

        public DataTable GetContactDetails_10(usefull_Contact contact)
        {
            return dA_Contact.get_contact_details_10(contact);
        }
        public DataTable GetContactDetails_11(usefull_Contact contact)
        {
            return dA_Contact.get_contact_details_11(contact);
        }
    }
}
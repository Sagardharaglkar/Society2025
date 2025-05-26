using DataAccessLayer.DA;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Utility.DataClass;

namespace BusinessLogic.BL
{
    public class BL_Contact_Master
    {
        DA_Contact_Master dA_Contact = new DA_Contact_Master();
        public DataSet GetContactDetails_1(usefull_Contact contact)
        {
            return dA_Contact.get_contact_details_1(contact);
        }

        public DataSet GetContactDetails_2(usefull_Contact contact)
        {
            return dA_Contact.get_contact_details_2(contact);
        }

        public DataSet GetContactDetails_3(usefull_Contact contact)
        {
            return dA_Contact.get_contact_details_3(contact);
        }

        public DataSet GetContactDetails_4(usefull_Contact contact)
        {
            return dA_Contact.get_contact_details_4(contact);
        }
        public DataSet GetContactDetails_5(usefull_Contact contact)
        {
            return dA_Contact.get_contact_details_5(contact);
        }

        public DataSet GetContactDetails_6(usefull_Contact contact)
        {
            return dA_Contact.get_contact_details_6(contact);
        }

        public DataSet GetContactDetails_7(usefull_Contact contact)
        {
            return dA_Contact.get_contact_details_7(contact);
        }

        public DataSet GetContactDetails_8(usefull_Contact contact)
        {
            return dA_Contact.get_contact_details_8(contact);
        }

        public DataSet GetContactDetails_9(usefull_Contact contact)
        {
            return dA_Contact.get_contact_details_9(contact);
        }

        public DataSet GetContactDetails_10(usefull_Contact contact)
        {
            return dA_Contact.get_contact_details_10(contact);
        }
        public DataSet GetContactDetails_11(usefull_Contact contact)
        {
            return dA_Contact.get_contact_details_11(contact);
        }
    }
}
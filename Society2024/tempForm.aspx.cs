using BusinessLogic.MasterBL;
using DBCode.DataClass;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Society2024
{
    public partial class tempForm : System.Web.UI.Page
    {

        BL_Owner_Master bl = new BL_Owner_Master();


        public class Category
        {
            public int Id { get; set; }
            public string Name { get; set; }
        }

        public class Item
        {
            public int Id { get; set; }
            public string Name { get; set; }
            public int CategoryId { get; set; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                String str = "select * from types;";
                bl.fill_list(Repeater1, str);
                //categoryRepeater.DataSource = categories;
                //categoryRepeater.DataBind();
            }
        }

        // When a category is selected
        protected void CategoryRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "SelectCategory")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                string str = "select flat_id, flat_no from flat_master where flat_type_id =" + id + ";";
                bl.fill_list(Repeater2, str);
            }
        }


        
    }
}

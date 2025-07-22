using BusinessLogic.MasterBL;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utility.DataClass;

namespace Society2024
{
    public partial class society_receipt : System.Web.UI.Page
    {
        BL_User_Login BL_Login = new BL_User_Login();
        Login_Details details = new Login_Details();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["name"] == null)
            {
                Response.Redirect("login1.aspx");
            }
            else
                Society_id.Value = Session["Society_id"].ToString();

            if (!IsPostBack)
            {
                showData();
            }
        }

        private void showData()
        {
            details.Sql_Operation = "society_receipt";
            details.Name = "";
            details.Society_Id = Society_id.Value;
            var result = BL_Login.society_receipt(details);
            GridView1.DataSource = result;
            ViewState["dirState"] = result;
            GridView1.DataBind();
            GridView2.DataSource = result;
            GridView2.DataBind();
        }

        // Method to handle the payment submission
        protected void SubmitPayment(object sender, EventArgs e)
        {
            // Capture payment details from the form
            string paymentAmount = Request.Form["paymentAmount"];
            string paymentMode = Request.Form["paymentMode"];
            string paymentNotes = Request.Form["paymentNotes"];
            string SocietyId = Society_id.Value;

            // Create a PaymentDetails object to pass to the business layer
            PaymentDetails paymentDetails = new PaymentDetails
            {
                Amount = paymentAmount,
                Mode = paymentMode,
                Notes = paymentNotes,
                SocietyId =SocietyId
            };

            try
            {
                // Call the InsertPayment method from BL_User_Login to insert payment data into the database
                BL_Login.InsertPayment(details);

                // Provide feedback to the user (optional)
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Payment submitted successfully!');", true);

                // Optionally, reload the data (e.g., refresh the GridView)
                showData();
            }
            catch (Exception ex)
            {
                // Handle any exceptions that might occur
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", $"alert('Error: {ex.Message}');", true);
            }
        }
    }

    // PaymentDetails class to capture payment information
    public class PaymentDetails
    {
        public string Amount { get; set; }
        public string Mode { get; set; }
        public string Notes { get; set; }
        public string SocietyId { get; set; }
    }
}

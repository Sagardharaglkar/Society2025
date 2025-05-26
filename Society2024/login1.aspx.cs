using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net;
using Utility.DataClass;
using BusinessLogic.MasterBL;

namespace Society
{
    public partial class login1 : System.Web.UI.Page
    {
        BL_User_Login BL_Login = new BL_User_Login();
        Login_Details details = new Login_Details();



        protected void btn_Login_Click(object sender, EventArgs e)       
        {
            details.UserName = txt_Username.Text;
            details.Password = txt_password.Text;
            var result = BL_Login.UpdateLoginDetails(details);
           Session["UserId"] = result.UserLoginId;
            Session["name"] = result.Name;
            Session["society_id"] = result.Society_Id;
            Session["society_name"] = result.Society_Name;
            if (result.Name != "")
            {
                Response.Redirect("dashboard.aspx");
            }
            else
            {
                lbl.Text = "Invalid Name or Password";
            }
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("new_registration.aspx");
        }
    }
}





    //public string runproc(String operation)
    //{
    //    ICollection<System.Collections.ArrayList> data_item = new List<System.Collections.ArrayList>();
    //    SqlDataReader sdr1 = null;
    //    int sdr = 0;
    //    string status1 = "";
    //    data_item.Add(st.create_array("operation", operation));
    //    data_item.Add(st.create_array("UserLoginId", UserLoginId.Value == null ? (object)DBNull.Value : UserLoginId.Value));
    //    if (operation == "Update")
    //    {

    //        data_item.Add(st.create_array("Name", string.IsNullOrWhiteSpace(txt_Name.Text) ? (object)DBNull.Value : txt_Name.Text));
    //        data_item.Add(st.create_array("UserName", string.IsNullOrWhiteSpace(txt_user.Text) ? (object)DBNull.Value : txt_user.Text));
    //        data_item.Add(st.create_array("Password", string.IsNullOrWhiteSpace(txt_new_pass.Text) ? (object)DBNull.Value : txt_new_pass.Text));

    //        data_item.Add(st.create_array("Address", string.IsNullOrWhiteSpace(txt_Address.Text) ? (object)DBNull.Value : txt_Address.Text));
    //        data_item.Add(st.create_array("Mobile", string.IsNullOrWhiteSpace(txt_Mobile.Text) ? (object)DBNull.Value : txt_Mobile.Text));
    //        data_item.Add(st.create_array("Emailid", string.IsNullOrWhiteSpace(txt_Emailid.Text) ? (object)DBNull.Value : txt_Emailid.Text));
    //    }
    //    status1 = st.run_query_scalar(data_item, "Select", "sp_UserLogin", ref sdr);
    //    if (status1 == "Done")
    //        UserLoginId.Value = sdr.ToString();

    //    data_item.Clear();
    //    data_item.Add(st.create_array("operation", "Select"));
    //    data_item.Add(st.create_array("UserLoginId", UserLoginId.Value == null ? (object)DBNull.Value : UserLoginId.Value));
    //    status1 = st.run_query(data_item, "Select", "sp_UserLogin", ref sdr1);
    //    if (sdr1.Read())
    //        society_id.Value = sdr1["society_id"].ToString();
    //    Session["society_id"] = society_id.Value;

    //    return status1;
    //    //status1 = st.run_query(data_item, operation, "sp_UserLogin", ref sdr);

    //    //if (status1 == "Done")
    //    //{
    //    //    if (operation == "Select")
    //    //    {
    //    //        while (sdr.Read())
    //    //        {
    //    //            txt_Name.Text = sdr["Name"].ToString();
    //    //            txt_UserName.Text = sdr["Username"].ToString();
    //    //            txt_Password.Text = sdr["Password"].ToString();

    //    //            txt_Address.Text = sdr["Address"].ToString();
    //    //            txt_Mobile.Text = sdr["Mobile"].ToString();
    //    //            txt_Emailid.Text = sdr["Emailid"].ToString();

    //    //        }
    //    //    }

    //    //}
    //    //return status1;
    //}


    //protected void btn_save_Click(object sender, EventArgs e)
    //{
    //    runproc("Update");
    //    // Response.Redirect("society_search.aspx?UserLoginId=" + Session["UserTypeId"].ToString());
    //    Response.Redirect("new_society.aspx");
    //}



    //protected void btn_verify2_Click(object sender, EventArgs e)
    //{
    //    Panel2.Visible = true;
    //}
    //protected string Generate_otp()
    //{
    //    char[] charArr = "0123456789".ToCharArray();
    //    string strrandom = string.Empty;
    //    Random objran = new Random();
    //    for (int i = 0; i < 4; i++)
    //    {
    //        //It will not allow Repetation of Characters
    //        int pos = objran.Next(1, charArr.Length);
    //        if (!strrandom.Contains(charArr.GetValue(pos).ToString())) strrandom += charArr.GetValue(pos);
    //        else i--;
    //    }
    //    return strrandom;
    //}
    //protected void btn_verify1_Click(object sender, EventArgs e)
    //{
    //    string otp = Generate_otp();
    //    string mobileNo = txt_Mobile.Text.Trim();
    //    string SMSContents = "", smsResult = "";
    //    SMSContents = otp + " is your One-Time Password, valid for 10 minutes only, Please do not share your OTP with anyone.";
    //    smsResult = SendSMS(mobileNo, SMSContents);
    //    txt_Mobile.Focus();
    //    //lblMsg.Text = " OTP is sent to your registered mobile no.";
    //    //lblMsg.CssClass = "green";
    //    mobileNo = string.Empty;
    //    txt_Mobile.Focus();
    //    Page.ClientScript.RegisterStartupScript(this.GetType(), "CallMyFunction", "countdown()", true);
    //    Panel1.Visible = true;

    //}
    //public static string SendSMS(string MblNo, string Msg)
    //{
    //    string MainUrl = "SMSAPIURL"; //Here need to give SMS API URL
    //    string UserName = "username"; //Here need to give username
    //    string Password = "Password"; //Here need to give Password
    //    string SenderId = "SenderId";
    //    string strMobileno = MblNo;
    //    string URL = "";
    //    URL = MainUrl + "username=" + UserName + "&msg_token=" + Password + "&sender_id=" + SenderId + "&message=" + HttpUtility.UrlEncode(Msg).Trim() + "&mobile=" + strMobileno.Trim() + "";
    //    string strResponce = GetResponse(URL);
    //    string msg = "";
    //    if (strResponce.Equals("Fail"))
    //    {
    //        msg = "Fail";
    //    }
    //    else
    //    {
    //        msg = strResponce;
    //    }
    //    return msg;
    //}
    //public static string GetResponse(string smsURL)
    //{
    //    try
    //    {
    //        WebClient objWebClient = new WebClient();
    //        System.IO.StreamReader reader = new System.IO.StreamReader(objWebClient.OpenRead(smsURL));
    //        string ResultHTML = reader.ReadToEnd();
    //        return ResultHTML;
    //    }
    //    catch (Exception)
    //    {
    //        return "Fail";
    //    }
    //}
    //protected void txt_Emailid_TextChanged(object sender, EventArgs e)
    //{
    //    txt_user.Text = txt_Emailid.Text;
    //    //txt_UserName.Enabled = false;
    //}


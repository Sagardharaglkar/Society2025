using BusinessLogic.MasterBL;
using FirebaseAdmin.Messaging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utility.DataClass;

namespace Society
{
    public partial class SiteMaster : MasterPage
    {
        BL_User_Login BL_Login = new BL_User_Login();
        Login_Details details = new Login_Details();
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
            Response.Cache.SetNoStore();

            if (!IsPostBack)
            {
                if (Session["Name"] != null)
                {
                    Panel1.Visible = true;
                    txt_welcome.Text = "Hello,\n" + Session["Name"].ToString();
                    name_society.Text = "Welcome To " + Session["society_name"].ToString();
                    get_notificatoin();
                }
                else
                    Panel1.Visible = false;
            }
        }

        protected void TimerNotif_Tick(object sender, EventArgs e)
        {
            // Only update notifCount label
            //details.Sql_Operation = "Notification";
            //details.Society_Id = Session["society_id"].ToString();
            //details.UserLoginId = int.Parse(Session["UserId"].ToString());
            //var dt = BL_Login.get_notification(details);
            //notifCount.Text = (dt.Rows.Count > 99) ? "99+" : dt.Rows.Count.ToString();
            get_notificatoin();
            upNotifList.Update();
        }



        protected void get_notificatoin()
        {
            //Session["UserId"] = result.UserLoginId;
            details.Sql_Operation = "Notification";
            details.Society_Id = Session["society_id"].ToString();
            details.UserLoginId =int.Parse( Session["UserId"].ToString());

            var dt =  BL_Login.get_notification(details);
            notifCount.Text = (dt.Rows.Count > 99)? "99+" : dt.Rows.Count.ToString();
            badgePanel.Visible = dt.Rows.Count != 0;
            noNotif.Visible = dt.Rows.Count == 0;   
            Notification_grid.DataSource = dt;
            Notification_grid.DataBind();

        }

        protected void Update_Notify_Status(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Redirect")
            {
                int id = Convert.ToInt32(e.CommandArgument);
                 details.NoticeId = id;

                details.Society_Id = Session["society_id"].ToString();

                details.Sql_Operation = "UpdateStatus";

                BL_Login.UpdateNotifyStatus(details);

                get_notificatoin();

                Response.Redirect("support_ticket.aspx");
            }
        }



        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.UtcNow.AddHours(-1));
            Response.Cache.SetNoStore();
            Response.Redirect("login1.aspx", true);

        }

        protected void lnkDetails2_Click(object sender, EventArgs e)
        {
            get_notificatoin();
        }
    }
}
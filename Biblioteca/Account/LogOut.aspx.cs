using System;
using System.Web.Security;

namespace Biblioteca.Account
{
    public partial class LogOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Redirect("/Account/LogIn.aspx", false);
            FormsAuthentication.SignOut();
            Session.Clear();
           
        }
    }
}
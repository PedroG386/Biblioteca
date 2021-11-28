using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Biblioteca
{
    public partial class Sitio : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                var userLog = (Entidades.Usuarios)Session["UserLog"];
                lbl_userLog.Text = $"Usuario: {userLog.Usuario}";
            }
            catch(NullReferenceException ex)
            {
                Response.Redirect("Account/LogIn.aspx",true);
            }
        }
    }
}
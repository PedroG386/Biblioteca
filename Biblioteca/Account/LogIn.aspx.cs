using Procedures;
using System;
using System.Drawing;

namespace Biblioteca.Account
{
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
     
        }

        void getUserLogin()
        {
            var user = GetUsuarioByUsuario.Get(inp_usuario.Text);
            try
            {
                if (user.Contraseña == inp_contraseña.Text)
                {
                    Session["UserLog"] = user;
                    Response.Redirect("/Inicio.aspx", false);
                }
                else
                {
                    lbl_msgErr.ForeColor = Color.White;
                    lbl_msgErr.BackColor = Color.Red;
                    lbl_msgErr.Text = "  Datos incorrectos, ingresalos nuevamente  ";
                }
            }
            catch(NullReferenceException ex)
            {
                lbl_msgErr.ForeColor = Color.White;
                lbl_msgErr.BackColor = Color.Red;
                lbl_msgErr.Text = "  Datos incorrectos, ingresalos nuevamente  ";
                Console.WriteLine(ex.Message);
            }
        }

        protected void btn_ingresa_Click(object sender, EventArgs e)
        {
            getUserLogin();
        }
    }
}
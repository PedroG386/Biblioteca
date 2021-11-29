using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Procedures;

namespace Biblioteca.Prestamos
{
    public partial class prestamos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_genera_Click(object sender, EventArgs e)
        {
            Entidades.Prestamos prestamos = new Entidades.Prestamos();
            var userLog = (Usuarios)Session["UserLog"];

            prestamos.id_estudiante = Convert.ToInt32(cb_estudiantes.SelectedValue);
            prestamos.id_libro = Convert.ToInt32(cb_libros.SelectedValue);
            prestamos.fechaPrestamo = dtp_fecha.Date;
            prestamos.Observaciones = inp_observaciones.Text;
            prestamos.id_usuario = userLog.id_usuario;

            if (Insert_Prestamo.Insert(prestamos) > 0)
            {
                Response.Redirect("/Prestamos/prestamos.aspx",false);
            }

        }
    }
}
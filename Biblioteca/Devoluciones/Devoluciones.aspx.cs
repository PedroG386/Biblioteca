using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Biblioteca.Devoluciones
{
    public partial class Devoluciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_registro_Click(object sender, EventArgs e)
        {
            Entidades.Devoluciones devolucion = new Entidades.Devoluciones();
            var userLog = (Entidades.Usuarios)Session["UserLog"];

            devolucion.fechaDevolucion = dtp_fecha.Date;
            devolucion.id_estudiante = Convert.ToInt32(cb_estudiante.SelectedValue);
            devolucion.id_libro = Convert.ToInt32(cb_libros.SelectedValue);
            devolucion.id_usuario = userLog.id_usuario;

            if (Procedures.Insert_Devoluciones.Insert(devolucion) > 0)
            {
                Response.Redirect("/Devoluciones/devoluciones.aspx", false);
            }

        }
    }
}
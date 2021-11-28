using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Procedures;

namespace Biblioteca.Estudiantes
{
    public partial class estudiantes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_registra_Click(object sender, EventArgs e)
        {
            Estudiante estudiante = new Estudiante();

            estudiante.nombre = inp_nombre.Text;
            estudiante.apellido = inp_apellidos.Text;
            estudiante.fechaIngreso = dtp_fechaIngreso.Date;
            estudiante.NoControl = inp_Ncontrol.Text;
            estudiante.Escuela = inp_escuela.Text;
            estudiante.Edad = Convert.ToInt32(inp_edad.Text);

            if (Insert_Estudiante.Insert(estudiante) > 0)
            {
                Response.Redirect("/Estudiantes/estudiantes.aspx",false);
            }
        }
    }
}
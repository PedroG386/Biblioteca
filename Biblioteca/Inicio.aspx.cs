using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Procedures;

namespace Biblioteca
{
    public partial class defualt : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            var nums = Get_NumEstadisticas.Get();
            lbl_numPrestamos.Text = nums.Prestamos.ToString();
            lbl_numeDevoluciones.Text = nums.Devoluciones.ToString();
            lbl_numLibros.Text = nums.Libros.ToString();
            lbl_numEstudiantes.Text = nums.Estudiante.ToString();

        }
    }
}
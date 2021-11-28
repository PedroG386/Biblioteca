using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Procedures;

namespace Biblioteca.Libros
{
    public partial class libros : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        void insertaLibro()
        {
            Libro libro = new Libro();
            libro.nombre = inp_nombre.Text;
            libro.id_editorial = Convert.ToInt32(cb_editoriales.SelectedValue);
            libro.id_autor = Convert.ToInt32(cb_autores.SelectedValue);
            libro.fechaLanzamiento = dtp_fecha.Date;
            libro.Genero = inp_generp.Text;

            if (INsertaLibro.Insert(libro) > 0)
            {
                Response.Redirect("/Libros/libros.aspx", false);
            }
        }

        protected void btn_inserta_Click(object sender, EventArgs e)
        {
            insertaLibro();
        }
    }
}
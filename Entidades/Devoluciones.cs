using System;
using System.Collections.Generic;
using System.Text;

namespace Entidades
{
    public class Devoluciones
    {
        public int id_devolucion { get; set; }
        public DateTime fechaDevolucion { get; set; }
        public int id_estudiante { get; set; }
        public int id_libro { get; set; }
        public int id_usuario { get; set; }
    }
}

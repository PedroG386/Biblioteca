using System;

namespace Entidades
{
    public class Prestamos
    {
        public int id_prestamo { get; set; }
        public int id_estudiante { get; set; }
        public int id_libro { get; set; }
        public DateTime fechaPrestamo { get; set; }
        public string Observaciones { get; set; }
        public DateTime fechaLog { get; set; }
        public int id_usuario { get; set; }

    }
}

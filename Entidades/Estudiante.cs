using System;

namespace Entidades
{
    public class Estudiante
    {
        public int id_estudiante { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public DateTime fechaIngreso { get; set; }
        public string NoControl { get; set; }
        public string Escuela { get; set; }
        public int Edad { get; set; }

    }
}

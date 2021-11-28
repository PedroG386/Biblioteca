using System;

namespace Entidades
{
    public class Libro
    {
        public int id_libro { get; set; }
        public string nombre { get; set; }
        public int id_autor { get; set; }
        public int id_editorial { get; set; }
        public DateTime fechaLanzamiento { get; set; }
        public string Genero { get; set; }
    }
}

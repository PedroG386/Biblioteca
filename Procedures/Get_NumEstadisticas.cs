using ConexionBD;
using Entidades;
using System.Collections.Generic;

namespace Procedures
{
    public class Get_NumEstadisticas
    {
        public static Statics Get()
        {
            DbManager conexion = new DbManager();
            return conexion.ExecuteSingle<Statics>("Get_NumEstadisticas");
        }
    }
}

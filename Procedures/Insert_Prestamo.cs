using System;
using System.Collections.Generic;
using System.Text;
using Entidades;
using ConexionBD;

namespace Procedures
{
   public class Insert_Prestamo
    {
        public static int Insert(Prestamos obj)
        {
            if (obj == null)
            {
                throw new System.ArgumentNullException(nameof(obj));
            }
            else
            {
                List<DbParameter> parametros = new List<DbParameter>
                {
                    new DbParameter(NombreParametro: "id_estudiante ", TipoParametro: System.Data.ParameterDirection.Input, ValorParametro: obj.id_estudiante),
                    new DbParameter(NombreParametro: "id_libro", TipoParametro: System.Data.ParameterDirection.Input, ValorParametro: obj.id_libro),
                    new DbParameter(NombreParametro: "fechaPrestamo", TipoParametro: System.Data.ParameterDirection.Input, ValorParametro: obj.fechaPrestamo),
                    new DbParameter(NombreParametro: "Observaciones", TipoParametro: System.Data.ParameterDirection.Input, ValorParametro: obj.Observaciones),
                    new DbParameter(NombreParametro: "id_usuario", TipoParametro: System.Data.ParameterDirection.Input, ValorParametro: obj.id_usuario),

                    };

                DbManager conexion = new DbManager();
                return conexion.ExecuteNonQuery("Insert_Prestamo", parametros);
            }
        }
    }
}

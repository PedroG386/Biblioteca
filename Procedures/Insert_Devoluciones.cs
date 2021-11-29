using System;
using System.Collections.Generic;
using System.Text;
using ConexionBD;
using Entidades;

namespace Procedures
{
    public class Insert_Devoluciones
    {
        public static int Insert(Devoluciones obj)
        {
            if (obj == null)
            {
                throw new System.ArgumentNullException(nameof(obj));
            }
            else
            {
                List<DbParameter> parametros = new List<DbParameter>
                {
                    new DbParameter(NombreParametro: "fechaDevolucion ", TipoParametro: System.Data.ParameterDirection.Input, ValorParametro: obj.fechaDevolucion),
                    new DbParameter(NombreParametro: "id_estudiante", TipoParametro: System.Data.ParameterDirection.Input, ValorParametro: obj.id_estudiante),
                    new DbParameter(NombreParametro: "id_libro", TipoParametro: System.Data.ParameterDirection.Input, ValorParametro: obj.id_libro),
                    new DbParameter(NombreParametro: "id_usuario", TipoParametro: System.Data.ParameterDirection.Input, ValorParametro: obj.id_usuario),
                

                    };

                DbManager conexion = new DbManager();
                return conexion.ExecuteNonQuery("Insert_Devoluciones", parametros);
            }
        }
    }
}

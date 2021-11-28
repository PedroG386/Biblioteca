using System;
using System.Collections.Generic;
using System.Text;
using ConexionBD;
using Entidades;

namespace Procedures
{
   public class Insert_Estudiante
    {
        public static int Insert(Estudiante obj)
        {
            if (obj == null)
            {
                throw new System.ArgumentNullException(nameof(obj));
            }
            else
            {
                List<DbParameter> parametros = new List<DbParameter>
                {
                    new DbParameter(NombreParametro: "nombre", TipoParametro: System.Data.ParameterDirection.Input, ValorParametro: obj.nombre),
                    new DbParameter(NombreParametro: "apellido", TipoParametro: System.Data.ParameterDirection.Input, ValorParametro: obj.apellido),
                    new DbParameter(NombreParametro: "fechaIngreso", TipoParametro: System.Data.ParameterDirection.Input, ValorParametro: obj.fechaIngreso),
                    new DbParameter(NombreParametro: "NoControl", TipoParametro: System.Data.ParameterDirection.Input, ValorParametro: obj.NoControl),
                    new DbParameter(NombreParametro: "Escuela", TipoParametro: System.Data.ParameterDirection.Input, ValorParametro: obj.Escuela),
                    new DbParameter(NombreParametro: "Edad", TipoParametro: System.Data.ParameterDirection.Input, ValorParametro: obj.Edad),

                    };

                DbManager conexion = new DbManager();
                return conexion.ExecuteNonQuery("Insert_Estudiante", parametros);
            }
        }
    }
}

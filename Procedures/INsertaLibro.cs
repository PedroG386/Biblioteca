using System;
using System.Collections.Generic;
using System.Text;
using Entidades;
using ConexionBD;

namespace Procedures
{
    public class INsertaLibro
    {
        public static int Insert(Libro obj)
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
                    new DbParameter(NombreParametro: "id_autor", TipoParametro: System.Data.ParameterDirection.Input, ValorParametro: obj.id_autor),
                    new DbParameter(NombreParametro: "id_editorial", TipoParametro: System.Data.ParameterDirection.Input, ValorParametro: obj.id_editorial),
                    new DbParameter(NombreParametro: "fechaLanzamiento", TipoParametro: System.Data.ParameterDirection.Input, ValorParametro: obj.fechaLanzamiento),
                    new DbParameter(NombreParametro: "Genero", TipoParametro: System.Data.ParameterDirection.Input, ValorParametro: obj.Genero),

                    };

                DbManager conexion = new DbManager();
                return conexion.ExecuteNonQuery("INsertaLibro", parametros);
            }
        }
    }
}

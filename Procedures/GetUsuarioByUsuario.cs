using ConexionBD;
using Entidades;
using System.Collections.Generic;

namespace Procedures
{
    public class GetUsuarioByUsuario
    {
        
            public static Usuarios Get(string usuario)
            {
                DbManager conexion = new DbManager();
                if (usuario == null)
                {
                    throw new System.ArgumentNullException(nameof(usuario));
                }
                else
                {
                    List<DbParameter> parametros = new List<DbParameter>
                {
                    new DbParameter(NombreParametro: "usuario", TipoParametro: System.Data.ParameterDirection.Input, ValorParametro:usuario)
                };

                    return conexion.ExecuteSingle<Usuarios>("GetUsuarioByUsuario", parametros);
                }
            }
        }
}

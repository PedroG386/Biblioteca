using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Reflection;

namespace ConexionBD
{
    public class DbManager
    {
        private static string ConnectionString
        {
            get
            {
                //return ConfigurationManager.ConnectionStrings["TravelAndLiveConnectionString"].ConnectionString; //return "Data Source=altaircloud.mx,1991;Initial Catalog=TravelAndLive;Persist Security Info=True;User ID=travelRoot;Password=nuevo123";
                return "Data Source=LAPTOP-5N3BRTAC;Initial Catalog=biblioteca;Persist Security Info=True;User ID=sa;Password=verdefiel3";
            }
        }
       

        private SqlConnection Connection { get; set; }

        private SqlCommand Command { get; set; }

        public List<DbParameter> OutParameters { get; private set; }

        private void Open()
        {
            try
            {
                Connection = new SqlConnection(ConnectionString);

                Connection.Open();
            }
            catch (Exception)
            {
                Close();
            }



        }
     

        private void Close()
        {
            if (Connection != null)
            {
                Connection.Close();
            }
        }


        private object ExecuteProcedure(string procedureName, ExecuteType executeType, List<DbParameter> parameters)
        {

            object returnObject = null;

            if (Connection != null)
            {
                if (Connection.State == ConnectionState.Open)
                {
                    SqlCommand sqlCommand = new SqlCommand(procedureName, Connection);
                    Command = sqlCommand;
                    Command.CommandType = CommandType.StoredProcedure;


                    if (parameters != null)
                    {
                        Command.Parameters.Clear();

                        foreach (DbParameter dbParameter in parameters)
                        {
                            SqlParameter sqlParameter = new SqlParameter();
                            SqlParameter parameter = sqlParameter;
                            parameter.ParameterName = "@" + dbParameter.Name;
                            parameter.Direction = dbParameter.Direction;
                            parameter.Value = dbParameter.Value;
                            Command.Parameters.Add(parameter);
                        }
                    }

                    switch (executeType)
                    {

                        case ExecuteType.ExecuteReader:
                            returnObject = Command.ExecuteReader();
                            break;
                        case ExecuteType.ExecuteNonQuery:
                            returnObject = Command.ExecuteNonQuery();
                            break;
                        case ExecuteType.ExecuteScalar:
                            returnObject = Command.ExecuteScalar();
                            break;
                        case ExecuteType.DataTable:
                            SqlDataAdapter da = new SqlDataAdapter(Command);
                            returnObject = da;
                            break;
                        default:
                            break;
                    }
                }
            }

            return returnObject;
        }


        private void UpdateOutParameters()
        {
            if (Command.Parameters.Count > 0)
            {
                OutParameters = new List<DbParameter>();
                OutParameters.Clear();

                for (int i = 0; i < Command.Parameters.Count; i++)
                {
                    if (Command.Parameters[i].Direction == ParameterDirection.Output)
                    {
                        OutParameters.Add(new DbParameter(Command.Parameters[i].ParameterName,
                                                          ParameterDirection.Output,
                                                          Command.Parameters[i].Value));
                    }
                }
            }
        }

        public List<T> ExecuteDataTable<T>(string procedureName) where T : new()
        {
            return ExecuteDataTable<T>(procedureName, null);
        }


        public List<T> ExecuteDataTable<T>(string procedureName, List<DbParameter> parameters) where T : new()
        {
            Open();
            SqlDataAdapter dataAdapter = (SqlDataAdapter)ExecuteProcedure(procedureName, ExecuteType.DataTable, parameters);
            DataTable datatable = new DataTable();
            dataAdapter.Fill(datatable);
            List<T> convertedData = new List<T>();


            Type itemType = typeof(T);


            BindingFlags bindingFlags = BindingFlags.Instance | BindingFlags.Public;


            Dictionary<string, PropertyInfo> availableProperties = new Dictionary<string, PropertyInfo>();
            foreach (DataColumn column in datatable.Columns)
            {
                PropertyInfo prop = itemType.GetProperty(column.ColumnName, bindingFlags);
                if (prop != null)
                {
                    availableProperties.Add(column.ColumnName, prop);
                }

            }


            foreach (DataRow row in datatable.Rows)
            {
                T item = new T();
                foreach (KeyValuePair<string, PropertyInfo> availableProperty in availableProperties)
                {
                    object propValue = row[availableProperty.Key];
                    if (propValue != null && propValue != System.DBNull.Value)
                    {
                        if (availableProperty.Value.PropertyType.Name.StartsWith("Nullable") && availableProperty.Value.PropertyType.IsGenericType)
                        {
                            availableProperty.Value.SetValue(item, propValue, null);
                        }
                        else
                        {
                            availableProperty.Value.SetValue(item, Convert.ChangeType(propValue, availableProperty.Value.PropertyType), null);
                        }
                    }

                    else
                    {
                        continue;
                    }

                }
                convertedData.Add(item);
            }
            UpdateOutParameters();
            Close();
            return convertedData;
        }



        public T ExecuteSingle<T>(string procedureName) where T : new()
        {
            return ExecuteSingle<T>(procedureName, null);
        }


        public T ExecuteSingle<T>(string procedureName, List<DbParameter> parameters) where T : new()
        {
            Open();
            IDataReader reader = (IDataReader)ExecuteProcedure(procedureName, ExecuteType.ExecuteReader, parameters);
            T tempObject = new T();

            if (reader.Read())
            {
                for (int i = 0; i < reader.FieldCount; i++)
                {
                    PropertyInfo propertyInfo = typeof(T).GetProperty(reader.GetName(i));

                    if (propertyInfo != null)
                    {
                        if (propertyInfo.PropertyType.Name.StartsWith("Nullable") && propertyInfo.PropertyType.IsGenericType)
                        {
                            propertyInfo.SetValue(tempObject, reader.GetValue(i), null);
                        }
                        else
                        {
                            propertyInfo.SetValue(tempObject, Convert.ChangeType(reader.GetValue(i), propertyInfo.PropertyType), null);
                        }

                    }



                }
            }

            reader.Close();

            UpdateOutParameters();

            Close();

            return tempObject;
        }


        public List<T> ExecuteList<T>(string procedureName) where T : new()
        {
            return ExecuteList<T>(procedureName, null);
        }


        public List<T> ExecuteList<T>(string procedureName, List<DbParameter> parameters) where T : new()
        {
            List<T> objects = new List<T>();

            Open();
            IDataReader reader = (IDataReader)ExecuteProcedure(procedureName, ExecuteType.ExecuteReader, parameters);

            while (reader.Read())
            {
                T tempObject = new T();

                for (int i = 0; i < reader.FieldCount; i++)
                {
                    if (reader.GetValue(i) != DBNull.Value)
                    {
                        PropertyInfo propertyInfo = typeof(T).GetProperty(reader.GetName(i));
                        propertyInfo.SetValue(tempObject, reader.GetValue(i), null);
                    }
                }

                objects.Add(tempObject);
            }

            reader.Close();

            UpdateOutParameters();

            Close();

            return objects;
        }
        public int ExecuteNonQuery(string procedureName)
        {
            return ExecuteNonQuery(procedureName, null);
        }

        public int ExecuteNonQuery(string procedureName, List<DbParameter> parameters)
        {
            int returnValue;

            Open();

            returnValue = (int)ExecuteProcedure(procedureName, ExecuteType.ExecuteNonQuery, parameters);


            UpdateOutParameters();

            Close();

            return returnValue;
        }
        public object ExecuteScalar(string procedureName)
        {
            return ExecuteScalar(procedureName, null);
        }
        public object ExecuteScalar(string procedureName, List<DbParameter> parameters)
        {
            object returnValue;

            Open();

            returnValue = ExecuteProcedure(procedureName, ExecuteType.ExecuteScalar, parameters);

            UpdateOutParameters();

            Close();

            return returnValue;
        }
        public DataSet ToDataSet<T>(List<T> items)
        {
            DataTable dataTable = new DataTable(typeof(T).Name);
            //Get all the properties
            PropertyInfo[] Props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
            foreach (PropertyInfo prop in Props)
            {
                //Setting column names as Property names
                dataTable.Columns.Add(prop.Name);
            }
            foreach (T item in items)
            {
                var values = new object[Props.Length];
                for (int i = 0; i < Props.Length; i++)
                {
                    values[i] = Props[i].GetValue(item, null);
                }
                dataTable.Rows.Add(values);
            }
            DataSet ds = new DataSet();
            ds.Tables.Add(dataTable);
            return ds;
        }
        public List<T> ExecuteTraccarDataTable<T>(string procedureName) where T : new()
        {
            return ExecuteTraccarDataTable<T>(procedureName, null);
        }


        public List<T> ExecuteTraccarDataTable<T>(string procedureName, List<DbParameter> parameters) where T : new()
        {
          
            SqlDataAdapter dataAdapter = (SqlDataAdapter)ExecuteProcedure(procedureName, ExecuteType.DataTable, parameters);
            DataTable datatable = new DataTable();
            dataAdapter.Fill(datatable);
            List<T> convertedData = new List<T>();


            Type itemType = typeof(T);


            BindingFlags bindingFlags = BindingFlags.Instance | BindingFlags.Public;


            Dictionary<string, PropertyInfo> availableProperties = new Dictionary<string, PropertyInfo>();
            foreach (DataColumn column in datatable.Columns)
            {
                PropertyInfo prop = itemType.GetProperty(column.ColumnName, bindingFlags);
                if (prop != null)
                {
                    availableProperties.Add(column.ColumnName, prop);
                }

            }


            foreach (DataRow row in datatable.Rows)
            {
                T item = new T();
                foreach (KeyValuePair<string, PropertyInfo> availableProperty in availableProperties)
                {
                    object propValue = row[availableProperty.Key];
                    if (propValue != null && propValue != System.DBNull.Value)
                    {
                        if (availableProperty.Value.PropertyType.Name.StartsWith("Nullable") && availableProperty.Value.PropertyType.IsGenericType)
                        {
                            availableProperty.Value.SetValue(item, propValue, null);
                        }
                        else
                        {
                            availableProperty.Value.SetValue(item, Convert.ChangeType(propValue, availableProperty.Value.PropertyType), null);
                        }
                    }

                    else
                    {
                        continue;
                    }

                }
                convertedData.Add(item);
            }
            UpdateOutParameters();
            Close();
            return convertedData;
        }

        public T ExecuteTraccarSingle<T>(string procedureName) where T : new()
        {
            return ExecuteTraccarSingle<T>(procedureName, null);
        }


        public T ExecuteTraccarSingle<T>(string procedureName, List<DbParameter> parameters) where T : new()
        {
        
            IDataReader reader = (IDataReader)ExecuteProcedure(procedureName, ExecuteType.ExecuteReader, parameters);
            T tempObject = new T();

            if (reader.Read())
            {
                for (int i = 0; i < reader.FieldCount; i++)
                {
                    PropertyInfo propertyInfo = typeof(T).GetProperty(reader.GetName(i));

                    if (propertyInfo != null)
                    {
                        if (propertyInfo.PropertyType.Name.StartsWith("Nullable") && propertyInfo.PropertyType.IsGenericType)
                        {
                            propertyInfo.SetValue(tempObject, reader.GetValue(i), null);
                        }
                        else
                        {
                            propertyInfo.SetValue(tempObject, Convert.ChangeType(reader.GetValue(i), propertyInfo.PropertyType), null);
                        }

                    }



                }
            }

            reader.Close();

            UpdateOutParameters();

            Close();

            return tempObject;
        }

    }

}


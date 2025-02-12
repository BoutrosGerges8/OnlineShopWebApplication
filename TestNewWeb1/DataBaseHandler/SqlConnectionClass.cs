using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace TestNewWeb1
{
    public class SqlConnectionClass
    {
        private string URL = @"Server=desktop-hr293u3;Database=OnlineShopWebApplication;Integrated Security=True;";
        private SqlConnection con = null;

        public SqlConnectionClass()
        {
            con = new SqlConnection(URL);
            con.Open();
        }

        public void CloseConnection()
        {
            if (con != null) con.Close();
        }

        public DataTable SelectAll(string tableName)
        {
            try
            {
                string query = $"SELECT * FROM {tableName};";
                return ExecuteQuery(query);
            }
            catch (Exception e)
            {
                throw new Exception($"Error while selecting all data from table '{tableName}': {e.Message}", e);
            }
        }

        public DataTable SelectColumns(string tableName, string[] cols)
        {
            try
            {
                if (cols.Length == 0) return null;

                string colsStr = string.Join(",", cols);
                string query = $"SELECT {colsStr} FROM {tableName};";
                return ExecuteQuery(query);
            }
            catch (Exception e)
            {
                throw new Exception($"Error while selecting columns from table '{tableName}': {e.Message}", e);
            }
        }

        public DataTable SelectAllCondition(string tableName, string condition)
        {
            try
            {
                string query = $"SELECT * FROM {tableName} WHERE {condition};";
                return ExecuteQuery(query);
            }
            catch (Exception e)
            {
                throw new Exception($"Error while selecting data with condition from table '{tableName}': {e.Message}", e);
            }
        }

        public DataTable SelectColumnsCondition(string tableName, string[] cols, string condition)
        {
            try
            {
                if (cols.Length == 0) return null;

                string colsStr = string.Join(",", cols);
                string query = $"SELECT {colsStr} FROM {tableName} WHERE {condition};";
                return ExecuteQuery(query);
            }
            catch (Exception e)
            {
                throw new Exception($"Error while selecting columns with condition from table '{tableName}': {e.Message}", e);
            }
        }

        public void InsertData(string tableName, Dictionary<string, object> values)
        {
            try
            {
                string columnsStr = string.Join(",", values.Keys);
                string parametersStr = string.Join(",", values.Keys.Select(k => "@" + k));

                string query = $"INSERT INTO {tableName} ({columnsStr}) VALUES ({parametersStr});";

                SqlCommand cmd = new SqlCommand(query, con);
                foreach (var kvp in values)
                {
                    cmd.Parameters.AddWithValue("@" + kvp.Key, kvp.Value ?? DBNull.Value);
                }

                ExecuteNonQuery(cmd);
            }
            catch (Exception e)
            {
                throw new Exception($"Error while inserting data into table '{tableName}': {e.Message}", e);
            }
        }

        public void Delete(string tableName, string condition)
        {
            try
            {
                string query = $"DELETE FROM {tableName} WHERE {condition};";
                ExecuteNonQuery(query);
            }
            catch (Exception e)
            {
                throw new Exception($"Error while deleting data from table '{tableName}': {e.Message}", e);
            }
        }

        public void UpdateData(string tableName, Dictionary<string, object> values, string condition)
        {
            try
            {
                string setClause = string.Join(",", values.Select(kvp => $"{kvp.Key} = @{kvp.Key}"));
                string query = $"UPDATE {tableName} SET {setClause} WHERE {condition};";

                SqlCommand cmd = new SqlCommand(query, con);
                foreach (var kvp in values)
                {
                    cmd.Parameters.AddWithValue("@" + kvp.Key, kvp.Value ?? DBNull.Value);
                }

                ExecuteNonQuery(cmd);
            }
            catch (Exception e)
            {
                throw new Exception($"Error while updating data in table '{tableName}': {e.Message}", e);
            }
        }

        public bool RowDataAllExists(string tableName, Dictionary<string, object> values, bool ignoreCase = false)
        {
            try
            {
                string whereClause = string.Join(" AND ", values.Select(kvp =>
                {
                    if (ignoreCase && kvp.Value is string)
                    {
                        return $"{kvp.Key} COLLATE SQL_Latin1_General_CP1_CI_AS = @{kvp.Key}";
                    }
                    else
                    {
                        return $"{kvp.Key} = @{kvp.Key}";
                    }
                }));

                string query = $"SELECT 1 FROM {tableName} WHERE {whereClause};";

                SqlCommand cmd = new SqlCommand(query, con);
                foreach (var kvp in values)
                {
                    cmd.Parameters.AddWithValue("@" + kvp.Key, kvp.Value ?? DBNull.Value);
                }

                return ExecuteScalar(cmd) != null;
            }
            catch (Exception e)
            {
                throw new Exception($"Error while checking if data exists in table '{tableName}': {e.Message}", e);
            }
        }


        /// <summary>
        /// Joins multiple tables using their Primary Key (PK) and Foreign Key (FK) relationships.
        /// </summary>
        /// <param name="tables">List of tables to join.</param>
        /// <param name="pkFkRelations">Dictionary of PK-FK relations (Key: Table.Column, Value: Table.Column).</param>
        /// <returns>DataTable containing the joined data.</returns>
        public DataTable JoinTables(string[] tables, Dictionary<string, string> pkFkRelations)
        {
            try
            {
                if (tables.Length < 2 || pkFkRelations.Count == 0)
                    throw new Exception("At least two tables and one PK-FK relation are required.");

                // Start with the first table
                string query = $"SELECT * FROM {tables[0]}";

                foreach (var relation in pkFkRelations)
                {
                    query += $" INNER JOIN {relation.Value.Split('.')[0]} ON {relation.Key} = {relation.Value}";
                }

                return ExecuteQuery(query);
            }
            catch (Exception e)
            {
                throw new Exception($"Error while joining tables: {e.Message}", e);
            }
        }
        public DataTable JoinTablesColumns(string[] tables, Dictionary<string, string> pkFkRelations, string[] columns)
        {
            try
            {
                if (tables.Length < 2 || pkFkRelations.Count == 0)
                    throw new Exception("At least two tables and one PK-FK relation are required.");

                if (columns.Length == 0)
                    throw new Exception("At least one column must be specified.");

                // Ensure columns are formatted with table names
                string columnsStr = string.Join(", ", columns.Select(c => c.Contains(".") ? c : $"{tables[0]}.{c}"));

                // Start building the query
                string query = $"SELECT {columnsStr} FROM {tables[0]}";

                foreach (var relation in pkFkRelations)
                {
                    query += $" INNER JOIN {relation.Value.Split('.')[0]} ON {relation.Key} = {relation.Value}";
                }

                return ExecuteQuery(query);
            }
            catch (Exception e)
            {
                throw new Exception($"Error while joining tables with selected columns: {e.Message}", e);
            }
        }


        private DataTable ExecuteQuery(string query)
        {
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            return dt;
        }

        private void ExecuteNonQuery(string query)
        {
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
        }

        private void ExecuteNonQuery(SqlCommand cmd)
        {
            cmd.ExecuteNonQuery();
        }

        private object ExecuteScalar(SqlCommand cmd)
        {
            return cmd.ExecuteScalar();
        }
    }
}

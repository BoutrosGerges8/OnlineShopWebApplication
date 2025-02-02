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
                //MessageBox.Show($"Error: {e}");

            }
            return null;
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
                //MessageBox.Show($"Error: {e}");
            }
            return null;
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
                //MessageBox.Show($"Error: {e}");
            }
            return null;
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
                //MessageBox.Show($"Error: {e}");
            }
            return null;
        }

        public void InsertData(string tableName, Dictionary<string, object> values)
        {
            try
            {
                string columnsStr = string.Join(",", values.Keys);
                string valuesStr = string.Join(",", values.Values.Select(v => v is string ? $"'{v}'" : v.ToString()));

                string query = $"INSERT INTO {tableName} ({columnsStr}) VALUES ({valuesStr});";
                ExecuteNonQuery(query);
            }
            catch (Exception e)
            {
                //MessageBox.Show($"Error: {e}");
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
                //MessageBox.Show($"Error: {e}");
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
                    cmd.Parameters.AddWithValue($"@{kvp.Key}", kvp.Value ?? DBNull.Value);
                }

                ExecuteNonQuery(cmd);
            }
            catch (Exception e)
            {
                //MessageBox.Show($"Error: {e}");
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
                        return $"{kvp.Key} COLLATE Latin1_General_BIN = @{kvp.Key}";
                    }
                }));
                string query = $"SELECT 1 FROM {tableName} WHERE {whereClause};";

                SqlCommand cmd = new SqlCommand(query, con);
                foreach (var kvp in values)
                {
                    cmd.Parameters.AddWithValue($"@{kvp.Key}", kvp.Value ?? DBNull.Value);
                }

                return ExecuteScalar(cmd) != null;
            }
            catch (Exception e)
            {
                //MessageBox.Show($"Error: {e}");
            }
            return false;
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

        private object ExecuteScalar(SqlCommand cmd)
        {
            return cmd.ExecuteScalar();
        }

        private void ExecuteNonQuery(SqlCommand cmd)
        {
            cmd.ExecuteNonQuery();
        }
    }
}

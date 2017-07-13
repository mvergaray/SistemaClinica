using Entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO
{
    public class DAProducto : SqlHelper
    {
        public BEProductos GetProductoxId(int id)
        {
            BEProductos result = new BEProductos();

            SqlCommand cmd = new SqlCommand("dbo.uspGetProductoxId");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Id", SqlDbType.Int, 14).Value = id;

            SqlDataReader reader = ExecuteReader(cmd, 1);
            while (reader.Read())
            {
                result.id = ((!reader[0].Equals(DBNull.Value)) ? reader.GetInt32(0) : -1);
                result.codigo = ((!reader[1].Equals(DBNull.Value)) ? reader.GetString(1) : "-");
                result.descripcion = ((!reader[2].Equals(DBNull.Value)) ? reader.GetString(2) : "-");
            }

            return result;
        }
    }
}

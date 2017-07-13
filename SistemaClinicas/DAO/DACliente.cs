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
    public class DACliente : SqlHelper
    {
        public BECliente GetClientexId(int id)
        {
            BECliente result = new BECliente();

            SqlCommand cmd = new SqlCommand("dbo.uspGetClientexId");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Id", SqlDbType.Int, 14).Value = id;

            SqlDataReader reader = ExecuteReader(cmd, 1);
            while (reader.Read())
            {
                result.id = ((!reader[0].Equals(DBNull.Value)) ? reader.GetInt32(0) : -1);
                result.codigo = ((!reader[1].Equals(DBNull.Value)) ? reader.GetString(1) : "-");
                result.nombres = ((!reader[2].Equals(DBNull.Value)) ? reader.GetString(2) : "-");
                result.apellidos = ((!reader[3].Equals(DBNull.Value)) ? reader.GetString(3) : "-");
                result.fecha_nacimiento = reader.GetDateTime(4);
                result.tipo_documento = ((!reader[5].Equals(DBNull.Value)) ? reader.GetString(5) : "-");
                result.num_documento = ((!reader[6].Equals(DBNull.Value)) ? reader.GetString(6) : "-");
            }
            return result;
        }
    }
}

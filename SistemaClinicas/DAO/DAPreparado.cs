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
    public class DAPreparado : SqlHelper
    {
        public BEPreparados GetPreparadoxId(int id)
        {
            BEPreparados result = new BEPreparados();

            SqlCommand cmd = new SqlCommand("dbo.uspGetPreparadoxId");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Id", SqlDbType.Int, 14).Value = id;

            SqlDataReader reader = ExecuteReader(cmd, 1);

            while (reader.Read())
            {
                result.id = ((!reader[0].Equals(DBNull.Value)) ? reader.GetInt32(0) : -1);
                result.codigo = ((!reader[1].Equals(DBNull.Value)) ? reader.GetString(1) : "-");
                result.nombre = ((!reader[2].Equals(DBNull.Value)) ? reader.GetString(2) : "-");
            }


            return result;
        }

        public void ActualizarStock(int id, int cantidad)
        {
            SqlCommand cmd = new SqlCommand("dbo.uspActualizarStockPreparado");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Id", SqlDbType.Int, 14).Value = id;
            cmd.Parameters.Add("@Cantidad", SqlDbType.Int, 14).Value = cantidad;

            UpdateCommand(cmd, 1);
        }
    }
}

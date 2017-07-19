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
    public class DAEmpleado : SqlHelper
    {
        public BEEmpleados GetEmpleadoxId(int id)
        {
            BEEmpleados result = new BEEmpleados();

            SqlCommand cmd = new SqlCommand("dbo.uspGetEmpleadoxId");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Id", SqlDbType.Int, 14).Value = id;

            SqlDataReader reader = ExecuteReader(cmd, 1);
            while (reader.Read())
            {
                result.id = ((!reader[0].Equals(DBNull.Value)) ? reader.GetInt32(0) : -1);
                result.codigo = ((!reader[1].Equals(DBNull.Value)) ? reader.GetString(1) : "-");
                result.apellidos = ((!reader[2].Equals(DBNull.Value)) ? reader.GetString(2) : "-");
                result.nombre = ((!reader[2].Equals(DBNull.Value)) ? reader.GetString(3) : "-");
                result.email = ((!reader[7].Equals(DBNull.Value)) ? reader.GetString(7) : "-");
                result.nombreCompleto = result.nombre + " " + result.apellidos;
            }
            return result;
        }

        public List<BEEmpleados> GetListaJefeFarmacia()
        {
            List<BEEmpleados> result = new List<BEEmpleados>();

            SqlCommand cmd = new SqlCommand("dbo.uspGetListJefeFarmacia");
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataReader reader = ExecuteReader(cmd, 1);
            while (reader.Read())
            {
                BEEmpleados item = new BEEmpleados();
                item.id = ((!reader[0].Equals(DBNull.Value)) ? reader.GetInt32(0) : -1);
                item.codigo = ((!reader[1].Equals(DBNull.Value)) ? reader.GetString(1) : "-");
                item.apellidos = ((!reader[2].Equals(DBNull.Value)) ? reader.GetString(2) : "-");
                item.nombre = ((!reader[2].Equals(DBNull.Value)) ? reader.GetString(3) : "-");
                item.email = ((!reader[7].Equals(DBNull.Value)) ? reader.GetString(7) : "-");
                item.nombreCompleto = item.nombre + " " + item.apellidos;

                result.Add(item);
            }
            return result;
        }
    }
}

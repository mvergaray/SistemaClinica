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
    public class DAOrden : SqlHelper
    {
        DACliente clienteDAO = new DACliente();
        DAProducto productoDAO = new DAProducto();
        DAPreparado preparadoDAO = new DAPreparado();
        public BEOrdenes GetOrdenxCod(string codigo, int tipo)
        {
            BEOrdenes result = new BEOrdenes();

            SqlCommand cmd = new SqlCommand("dbo.uspGetOrdenVentaxCod");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Codigo", SqlDbType.VarChar, 50).Value = codigo;

            SqlDataReader reader = ExecuteReader(cmd, 1);

            while (reader.Read())
            {
                result.id = (!reader[0].Equals(DBNull.Value)) ? reader.GetInt32(0) : -1;
                result.codigo = ((!reader[1].Equals(DBNull.Value)) ? reader.GetString(1) : "-");
                result.fecha = reader.GetDateTime(2);
                result.estado = ((!reader[3].Equals(DBNull.Value)) ? reader.GetString(3) : "-");
                result.id_empleado = ((!reader[4].Equals(DBNull.Value)) ? reader.GetInt32(4) : -1);
                result.id_receta = ((!reader[5].Equals(DBNull.Value)) ? reader.GetInt32(5) : -1);
                result.cliente = clienteDAO.GetClientexId((!reader[6].Equals(DBNull.Value)) ? reader.GetInt32(6) : -1);
                result.detalle_orden = GetDetalleOrdenxOrdenId(result.id, tipo);
            }

            return result;
        }

        public List<BEDetalleOrden> GetDetalleOrdenxOrdenId(int ordenId, int tipo)
        {
            List<BEDetalleOrden> result = new List<BEDetalleOrden>();

            SqlCommand cmd = new SqlCommand("dbo.uspGetDetalleOrdenVentaxOrdenId");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@OrdenId", SqlDbType.Int, 14).Value = ordenId;

            SqlDataReader reader = ExecuteReader(cmd, 1);

            while (reader.Read())
            {
                BEDetalleOrden item = new BEDetalleOrden();
                item.id = ((!reader[0].Equals(DBNull.Value)) ? reader.GetInt32(0) : -1);
                item.id_orden = ordenId;
                if (!reader[2].Equals(DBNull.Value)) {
                    item.producto = productoDAO.GetProductoxId(reader.GetInt32(2) );
                } else {
                    item.preparado = preparadoDAO.GetPreparadoxId((!reader[3].Equals(DBNull.Value)) ? reader.GetInt32(3) : -1);
                }
                item.codigo = ((!reader[4].Equals(DBNull.Value)) ? reader.GetString(4) : "-");
                item.cantidad = ((!reader[5].Equals(DBNull.Value)) ? reader.GetInt32(5) : -1);
                item.monto = Double.Parse(((!reader[6].Equals(DBNull.Value)) ? reader.GetDecimal(6) : -1).ToString());

                result.Add(item);
            }

            return result;
        }
    }
}

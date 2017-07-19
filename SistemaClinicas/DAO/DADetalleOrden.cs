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
    public class DADetalleOrden : SqlHelper
    {
        DAProducto productoDAO = new DAProducto();
        DAPreparado preparadoDAO = new DAPreparado();
        public List<BEDetalleOrdenDevolucion> GetDetalleOrdenxOrdenId(int ordenId, int tipo)
        {
            List<BEDetalleOrdenDevolucion> result = new List<BEDetalleOrdenDevolucion>();
            string uspNombre = tipo == 1 ? "dbo.uspGetDetalleOrdenVentaxOrdenId" : "dbo.uspGetDetalleOrdenAbastxOrdenId";
            SqlCommand cmd = new SqlCommand(uspNombre);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@OrdenId", SqlDbType.Int, 14).Value = ordenId;

            SqlDataReader reader = ExecuteReader(cmd, 1);

            while (reader.Read())
            {
                BEDetalleOrdenDevolucion item = new BEDetalleOrdenDevolucion();
                item.id = ((!reader[0].Equals(DBNull.Value)) ? reader.GetInt32(0) : -1);
                item.id_orden = ordenId;
                if (!reader[2].Equals(DBNull.Value))
                {
                    item.producto = productoDAO.GetProductoxId(reader.GetInt32(2));
                    item.descripcionGen = item.producto.descripcion;
                    item.codigoProdGen = item.producto.codigo;
                }
                else
                {
                    item.preparado = preparadoDAO.GetPreparadoxId((!reader[3].Equals(DBNull.Value)) ? reader.GetInt32(3) : -1);
                    item.descripcionGen = item.preparado.nombre;
                    item.codigoProdGen = item.preparado.codigo;
                }
                item.codigo = ((!reader[4].Equals(DBNull.Value)) ? reader.GetString(4) : "-");
                item.cantidad = ((!reader[5].Equals(DBNull.Value)) ? reader.GetInt32(5) : -1);
                item.monto = Double.Parse(((!reader[6].Equals(DBNull.Value)) ? reader.GetDecimal(6) : -1).ToString());

                result.Add(item);
            }

            return result;
        }

        public void InserDetalletOrden(List<BEDetalleOrdenDevolucion> detalle, int id_orden)
        {
            int count = 1;
            if (detalle.Count > 0)
            {
                foreach (var item in detalle)
                {
                    item.codigo = "DOD-" + id_orden.ToString().PadLeft(5, '0') + "-" + count.ToString().PadLeft(3, '0');
                    SqlCommand cmd = new SqlCommand("dbo.uspCrearDetalleOrdenDevolucion");
                    cmd.CommandType = CommandType.StoredProcedure;
	
                    cmd.Parameters.Add("@IdOrdenDevolucion", SqlDbType.Int, 14).Value = id_orden;
                    if (item.producto != null)
                        cmd.Parameters.Add("@IdProducto", SqlDbType.Int, 14).Value = item.producto.id;
                    if (item.preparado != null)
                        cmd.Parameters.Add("@IdPreparado", SqlDbType.Int, 14).Value = item.preparado.id;
                    cmd.Parameters.Add("@Codigo", SqlDbType.VarChar, 500).Value = item.codigo;
                    cmd.Parameters.Add("@Cantidad", SqlDbType.Int, 14).Value = item.cant_devolver;
                    cmd.Parameters.Add("@MontoDevuelto", SqlDbType.Int, 14).Value = item.monto / item.cantidad * item.cant_devolver;

                    InsertCommand(cmd, false, 1);
                    count++;
                }
            }
        }

        public void ActualizarDetalleOrdenOriginal(List<BEDetalleOrdenDevolucion> detalle, int tipo)
        {
            if (detalle.Count > 0)
            {
                foreach (var item in detalle)
                {
                    string uspNombre = tipo == 1 ? "dbo.uspActualizarDetalleOrdenVenta" : "dbo.uspActualizarDetalleOrdenAbastecimiento";
                    SqlCommand cmd = new SqlCommand(uspNombre);
                    cmd.CommandType = CommandType.StoredProcedure;
	
                    cmd.Parameters.Add("@Id", SqlDbType.Int, 14).Value = item.id;
                    cmd.Parameters.Add("@Cantidad", SqlDbType.Int, 14).Value = item.cant_devolver;
                    cmd.Parameters.Add("@Monto", SqlDbType.Decimal, 18).Value = (item.monto / item.cantidad) * (item.cantidad - item.cant_devolver);
                    UpdateCommand(cmd, 1);

                    if (item.producto != null && item.producto.id > 0)
                    {
                        productoDAO.ActualizarStock(item.producto.id, item.cant_devolver);
                    }

                    if (item.preparado != null && item.preparado.id > 0)
                    {
                        preparadoDAO.ActualizarStock(item.preparado.id, item.cant_devolver);
                    }
                }
            }
        }
    }
}

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
    public class DADevolucion : SqlHelper
    {
        DACliente clienteDAO = new DACliente();
        DAProducto productoDAO = new DAProducto();
        DAPreparado preparadoDAO = new DAPreparado();
        DADetalleOrden detalleOrdenDAO = new DADetalleOrden();
        DAArea areaDAO = new DAArea();
        DAEmpleado empleadoDAO = new DAEmpleado();

        public BEOrdenDevolucion GetOrdenxCod(string codigo, int tipo)
        {
            BEOrdenDevolucion result = new BEOrdenDevolucion();

            string uspNombre = tipo == 1 ? "dbo.uspGetOrdenVentaxCod" : "dbo.uspGetOrdenAbastxCod";
            SqlCommand cmd = new SqlCommand(uspNombre);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Codigo", SqlDbType.VarChar, 50).Value = codigo;

            SqlDataReader reader = ExecuteReader(cmd, 1);

            while (reader.Read())
            {
                if (tipo == 1)
                {
                    result.id = (!reader[0].Equals(DBNull.Value)) ? reader.GetInt32(0) : -1;
                    result.tipo = 1;
                    result.codigo = ((!reader[1].Equals(DBNull.Value)) ? reader.GetString(1) : "-");
                    result.fecha = reader.GetDateTime(2);
                    result.estado = ((!reader[3].Equals(DBNull.Value)) ? reader.GetString(3) : "-");
                    result.id_empleado = ((!reader[4].Equals(DBNull.Value)) ? reader.GetInt32(4) : -1);
                    result.id_receta = ((!reader[5].Equals(DBNull.Value)) ? reader.GetInt32(5) : -1);
                    result.cliente = clienteDAO.GetClientexId((!reader[6].Equals(DBNull.Value)) ? reader.GetInt32(6) : -1);
                }
                else
                {
                    result.id = (!reader[0].Equals(DBNull.Value)) ? reader.GetInt32(0) : -1;
                    result.tipo = 1;
                    result.codigo = ((!reader[1].Equals(DBNull.Value)) ? reader.GetString(1) : "-");
                    result.fecha = reader.GetDateTime(2);
                    result.estado = ((!reader[3].Equals(DBNull.Value)) ? reader.GetString(3) : "-");
                    result.encargado = empleadoDAO.GetEmpleadoxId((!reader[4].Equals(DBNull.Value)) ? reader.GetInt32(4) : -1);
                    result.id_empleado = ((!reader[5].Equals(DBNull.Value)) ? reader.GetInt32(5) : -1);
                    result.area = areaDAO.GetAreaxId((!reader[6].Equals(DBNull.Value)) ? reader.GetInt32(6) : -1);
                }

                
                result.detalle_orden = detalleOrdenDAO.GetDetalleOrdenxOrdenId(result.id, tipo);
            }

            return result;
        }

        public BEOrdenDevolucion InsertOrden(BEOrdenDevolucion orden){
            SqlCommand cmd = new SqlCommand("dbo.uspCrearOrdenDevolucion");
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add("@Codigo", SqlDbType.VarChar, 50).Value = "";
            cmd.Parameters.Add("@Fecha", SqlDbType.DateTime).Value = orden.fecha;
            cmd.Parameters.Add("@Estado", SqlDbType.VarChar, 150).Value = orden.estado;
            cmd.Parameters.Add("@Motivo", SqlDbType.VarChar, 500).Value = orden.motivo;
            cmd.Parameters.Add("@Id_empleado", SqlDbType.Int, 14).Value = orden.id_empleado;
            cmd.Parameters.Add("@Id_aprobador", SqlDbType.Int, 14).Value = orden.id_aprobador;
	        cmd.Parameters.Add("@Tipo_devolucion", SqlDbType.Int, 14).Value = orden.tipo_devolucion;
	        cmd.Parameters.Add("@Id_orden_venta", SqlDbType.Int, 14).Value = orden.id_orden_venta; 
	        cmd.Parameters.Add("@Id_orden_abastecimiento", SqlDbType.Int, 14).Value = orden.id_orden_abastecimiento;
            if (orden.cliente != null)
                cmd.Parameters.Add("@Id_cliente", SqlDbType.Int, 14).Value = orden.cliente.id;

            InsertCommand(cmd, true, 1);
            int lastId = getLastID;

            cmd = new SqlCommand("dbo.uspUpdateOrdenDevolucion");
            cmd.CommandType = CommandType.StoredProcedure;
            string codigo = "OD-" + lastId.ToString().PadLeft(5, '0');
            cmd.Parameters.Add("@Codigo", SqlDbType.VarChar, 50).Value = codigo;
            cmd.Parameters.Add("@Id", SqlDbType.Int, 14).Value = lastId;

            UpdateCommand(cmd, 1);

            orden.id = lastId;
            orden.codigo = codigo;
            return orden;
        }

        public BEOrdenDevolucion DevolverProducto(BEOrdenDevolucion ordenVenta, List<BEDetalleOrdenDevolucion> detalleDevolucion)
        {
            BEOrdenDevolucion result = new BEOrdenDevolucion();

            return result;
        }

        public List<BEOrden> BuscarOrden(int tipo, string nombre = "", string num_doc = "", string area = "", string responsable = "", string fecha = "")
        {
            List<BEOrden> result = new List<BEOrden>();

            string uspNombre = tipo == 1 ? "dbo.uspBuscarOrdenVenta" : "dbo.uspBuscarOrdenAbastecimiento";
            SqlCommand cmd = new SqlCommand(uspNombre);
            cmd.CommandType = CommandType.StoredProcedure;
            if (tipo == 1)
            {
                cmd.Parameters.Add("@Nombre", SqlDbType.VarChar, 500).Value = nombre;
                cmd.Parameters.Add("@Num_doc", SqlDbType.VarChar, 50).Value = num_doc;
                cmd.Parameters.Add("@Fecha", SqlDbType.DateTime).Value = fecha;
            }
            else
            {
                cmd.Parameters.Add("@Area", SqlDbType.VarChar, 500).Value = area;
                cmd.Parameters.Add("@Responsable", SqlDbType.VarChar, 500).Value = responsable;
                cmd.Parameters.Add("@Fecha", SqlDbType.DateTime).Value = fecha;
            }
            

            SqlDataReader reader = ExecuteReader(cmd, 1);

            while (reader.Read())
            {
                BEOrden item = new BEOrden();
                item.id = (!reader[0].Equals(DBNull.Value)) ? reader.GetInt32(0) : -1;
                item.codigo = (!reader[1].Equals(DBNull.Value)) ? reader.GetString(1) : "-";
                item.fecha = reader.GetDateTime(2);
                item.estado = (!reader[3].Equals(DBNull.Value)) ? reader.GetString(3) : "-";
                if (tipo == 1)
                {
                    item.cliente = clienteDAO.GetClientexId((!reader[4].Equals(DBNull.Value)) ? reader.GetInt32(4) : -1);
                    item.cliente.nombreCompleto = item.cliente.nombres + " " + item.cliente.apellidos;
                }
                else
                {
                    item.encargado = empleadoDAO.GetEmpleadoxId((!reader[4].Equals(DBNull.Value)) ? reader.GetInt32(4) : -1);
                    item.encargado.nombreCompleto = item.encargado.nombre + " " + item.encargado.apellidos;
                    item.area = areaDAO.GetAreaxId((!reader[6].Equals(DBNull.Value)) ? reader.GetInt32(6) : -1);
                }
                
                result.Add(item);
            }

            return result;
        }
    }
}

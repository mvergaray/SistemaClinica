using DAO;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocios
{
    public class BLDevolucion : Exceptions
    {
        DADevolucion devolucionDAO = new DADevolucion();
        DADetalleOrden detalleDevolucionDAO = new DADetalleOrden();
        DAEmpleado empleadoDAO = new DAEmpleado();

        public BEOrdenDevolucion GetOrdenxCod(string cod, int tipo)
        {
            return devolucionDAO.GetOrdenxCod(cod, tipo);
        }

        public BEOrdenDevolucion CrearOrdenDevolucion(BEOrdenDevolucion orden, bool actualizarOrigen = false) {
            BEOrdenDevolucion result = devolucionDAO.InsertOrden(orden);
            detalleDevolucionDAO.InserDetalletOrden(orden.detalle_orden, orden.id);

            if (actualizarOrigen)
            {
                detalleDevolucionDAO.ActualizarDetalleOrdenOriginal(orden.detalle_orden, orden.tipo_devolucion);
            }

            return result;
        }

        public List<BEEmpleados> GetListaJefeFarmacia()
        {
            return empleadoDAO.GetListaJefeFarmacia();
        }

        public BEEmpleados GetEmpleado(int id)
        {
            return empleadoDAO.GetEmpleadoxId(id);
        }
    }
}

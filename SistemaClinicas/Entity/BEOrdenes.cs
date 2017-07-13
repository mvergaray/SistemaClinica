using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    [Serializable]
    public class BEOrdenes
    {
        public int id { get; set; }
        public string codigo { get; set; }
        public DateTime fecha { get; set; }
        public string estado { get; set; }
        public string motivo { get; set; }
        public int id_empleado { get; set; }
        public int id_receta { get; set; }
        public int tipo_devolucion { get; set; }
        public int id_orden_venta { get; set; }
        public int id_orden_abastecimiento { get; set; }
        public BECliente cliente { get; set; }
        public List<BEDetalleOrden> detalle_orden { get; set; }

        public BEOrdenes ()
        {

        }
    }
}

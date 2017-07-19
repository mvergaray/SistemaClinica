using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    [Serializable]
    public class BEOrdenDevolucion : BEOrden
    {
        /*public int id { get; set; }
        public int tipo { get; set; } // Venta=1, Abastecimiento=2, Devolucion=3
        public string codigo { get; set; }
        public DateTime fecha { get; set; }
        public string estado { get; set; }*/
        public string motivo { get; set; }
        //public int id_empleado { get; set; }
        public int id_aprobador { get; set; }
        //public int id_receta { get; set; }
        public int tipo_devolucion { get; set; }// Venta=1, Abastecimiento=2
        public int id_orden_venta { get; set; }
        public int id_orden_abastecimiento { get; set; }
        /*public BECliente cliente { get; set; }
        public BEArea area { get; set; }
        public BEEmpleados encargado { get; set; }*/
        public List<BEDetalleOrdenDevolucion> detalle_orden { get; set; }

        public BEOrdenDevolucion ()
        {

        }
    }
}

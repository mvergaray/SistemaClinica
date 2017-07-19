using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    [Serializable]
    public class BEOrden
    {
        public int id { get; set; }
        public int tipo { get; set; } // Venta=1, Abastecimiento=2, Devolucion=3
        public string codigo { get; set; }
        public DateTime fecha { get; set; }
        public string estado { get; set; }
        public int id_empleado { get; set; }
        public int id_receta { get; set; }
        public BECliente cliente { get; set; }
        public BEArea area { get; set; }
        public BEEmpleados encargado { get; set; }
        public BEOrden()
        {

        }
    }
}

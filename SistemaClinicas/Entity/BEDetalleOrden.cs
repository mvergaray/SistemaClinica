using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    [Serializable]
    public class BEDetalleOrden
    {
        public int id { get; set; }
        public int id_orden { get; set; }
        public BEProductos producto { get; set; }
        public BEPreparados preparado { get; set; }
        public string codigo { get; set; }
        public int cantidad { get; set; }
        public double monto { get; set; }
        public string descripcionGen { get; set; }
        public string codigoProdGen { get; set; }
        public BEDetalleOrden()
        {

        }
    }
}

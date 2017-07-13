using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    [Serializable]
    public class BEProductos
    {
        public int id { get; set; }
        public string codigo { get; set; }
        public string descripcion { get; set; }
        public string marca { get; set; }
        public string laboratorio { get; set; }
        public double precio { get; set; }
        public int dosis { get; set; }
        public int stock { get; set; }
        public string unidad_medida { get; set; }
        public bool venta_publico { get; set; }
        public BEProductos()
        {

        }
    }
}

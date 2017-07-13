using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    [Serializable]
    class BEDetallePreparado
    {
        public int id { get; set; }
        public int id_preparado { get; set; }
        public int id_producto { get; set; }
        public string codigo { get; set; }
        public int cantidad { get; set; }
        public string composicion { get; set; }
        public BEDetallePreparado()
        {

        }
    }
}

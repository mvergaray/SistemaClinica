using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    [Serializable]
    public class BEPreparados
    {
        public int id { get; set; }
        public string codigo { get; set; }
        public string nombre { get; set; }
        public string instrucciones { get; set; }
        public int id_empleado { get; set; }
        public BEPreparados()
        {

        }
    }
}

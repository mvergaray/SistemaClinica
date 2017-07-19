using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    [Serializable]
    public class BEEmpleados
    {
        public int id { get; set; }
        public string codigo { get; set; }
        public string nombre { get; set; }
        public string apellidos { get; set; }
        public string email { get; set; }
        public string nombreCompleto { get; set; }
        public BEEmpleados()
        {

        }
    }
}

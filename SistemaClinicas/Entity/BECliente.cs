using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    [Serializable]
    public class BECliente
    {
        public int id { get; set; }
        public string codigo { get; set; }
        public string nombres { get; set; }
        public string apellidos { get; set; }
        public DateTime fecha_nacimiento { get; set; }
        public string tipo_documento { get; set; }
        public string num_documento { get; set; }
        public string nombreCompleto { get; set; }
        public BECliente()
        {

        }
    }
}

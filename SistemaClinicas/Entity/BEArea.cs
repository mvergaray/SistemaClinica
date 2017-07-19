using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    [Serializable]
    public class BEArea
    {
        public int id { get; set; }
        public string codigo { get; set; }
        public string descripcion { get; set; }

        public BEArea()
        {

        }
    }
}

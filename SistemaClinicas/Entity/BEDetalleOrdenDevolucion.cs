using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    [Serializable]
    public class BEDetalleOrdenDevolucion : BEDetalleOrden
    {
        public int cant_devolver { get; set; }
        
        public BEDetalleOrdenDevolucion()
        {

        }
    }
}

using DAO;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocios
{
    public class BLProducto : Exceptions
    {
        DAProducto productoDAO = new DAProducto();

        public BEProductos GetProductoxId(int id)
        {
            return productoDAO.GetProductoxId(id);
        }
    }
}

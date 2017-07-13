using DAO;
using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocios
{
    public class BLOrden : Exceptions
    {
        DAOrden ordenDAO = new DAOrden();

        public BEOrdenes GetOrdenxCod(string cod, int tipo)
        {
            return ordenDAO.GetOrdenxCod(cod, tipo);
        }
    }
}

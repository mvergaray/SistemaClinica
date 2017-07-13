using Entity;
using Negocios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ComprobantesRetencion
{
    public partial class header : System.Web.UI.Page
    {
        public BLOrden ordenCon = new BLOrden();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private BEOrdenes GetOrdenxCodTipo()
        {
            BEOrdenes orden =  ordenCon.GetOrdenxCod(lblLastSearchCode.Text, lblLastSearchType.Text == "Venta" ? 1 : 2);

            GridView1.DataSource = orden.detalle_orden;
            GridView1.DataBind();

            return orden;
        }

        protected void btnvalidar_Click(object sender, EventArgs e)
        {
            lblLastSearchCode.Text = txtNroOrden.Text;
            lblLastSearchType.Text = rdTipoOrden.Text;
            BEOrdenes orden = GetOrdenxCodTipo();
            string fechaHora = orden.fecha.ToShortDateString() + " - " + orden.fecha.ToShortTimeString();
            lblFechaOrden.Text = fechaHora;
            lblNombreCliente.Text = orden.cliente.nombres + " " + orden.cliente.apellidos;
            lblNumDocCliente.Text = orden.cliente.num_documento;

            /*foreach (var item in orden.detalle_orden)
            {
                // Create a new row and add it to the table.
                TableRow tRow = new TableRow();
                tblDetalleOrdenVenta.Rows.Add(tRow);
                TableCell id = new TableCell();
                TableCell descripcion = new TableCell();
                TableCell cantidad = new TableCell();
                TableCell precio = new TableCell();
                TableCell devolver = new TableCell();

                tRow.Cells.Add(id);
                tRow.Cells.Add(descripcion);
                tRow.Cells.Add(cantidad);
                tRow.Cells.Add(precio);
                tRow.Cells.Add(devolver);

                System.Web.UI.WebControls.TextBox txtDevolverCant = new TextBox();
                
                if (item.producto != null)
                {
                    id.Controls.Add(new LiteralControl(item.producto.codigo));
                    descripcion.Controls.Add(new LiteralControl(item.producto.descripcion));

                    txtDevolverCant.ID = item.producto.codigo;
                } else
                {
                    id.Controls.Add(new LiteralControl(item.preparado.codigo));
                    descripcion.Controls.Add(new LiteralControl(item.preparado.nombre));

                    txtDevolverCant.ID = item.preparado.codigo;
                }
                
                cantidad.Controls.Add(new LiteralControl(item.cantidad.ToString()));
                precio.Controls.Add(new LiteralControl(item.monto.ToString()));

                devolver.Controls.Add(txtDevolverCant);*/
            //}
        }

        protected void btnGenerar_Click(object sender, EventArgs e)
        {
            /*foreach (TableRow row in tblDetalleOrdenVenta.Rows)
            {
                //var control = (System.Web.UI.WebControls.TextBox) row.FindControl("ContentPlaceHolder1_PRO-001");
                //var test = control.Text;
                //https://www.aspsnippets.com/Articles/Make-one-Single-Specific-column-Editable-in-ASPNet-GridView.aspx
                var test1 = row.FindControl("ContentPlaceHolder1_PRO-001");
                var test2 = row.FindControl("PRO-001");
                var test3 = row.FindControl("ctl00$ContentPlaceHolder1$PRO-001");
                /*foreach (TableCell cell in row.Cells)
                {
                    
                    foreach (Control control in cell.Controls)
                    {
                        var test = ((System.Web.UI.WebControls.TextBox)control).Text;
                    }
                } */
           // }
        }



        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetOrdenxCodTipo();
        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            
        }
    }
}
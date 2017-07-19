using Entity;
using Negocios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ComprobantesRetencion
{
    public partial class header : System.Web.UI.Page
    {
        public BLDevolucion ordenCon = new BLDevolucion();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                limpiar();
            }
        }
        
        private void limpiar(bool softClean = false)
        {
            Session["searchType"] = "Venta";
            Session["ordenVenta"] = new BEOrdenDevolucion();
            Session["devolucion"] = new List<BEDetalleOrdenDevolucion>();
            Session["needApproval"] = false;
            Session["approver"] = new BEEmpleados();
            Session["editing"] = false;
            Session["listProdDev"] = new List<BEDetalleOrdenDevolucion>();
            Session["prodCount"] = 0;
            // Empleado por defecto con Id = 2
            Session["user"] = ordenCon.GetEmpleado(2);
            infoPanel.Visible = false;
            lblAprobarMsg.Visible = false;
            ventaPanel.Visible = false;
            abastecimientoPanel.Visible = false;
            ventaConfPanel.Visible = false;
            abastecimientoConfPanel.Visible = false;
            btnPreGenerar.Enabled = false;
            txtMotivo.Text = "";
            bxJefeFarmacia.Visible = false;
            bxAprobar.Visible = false;

            if (!softClean)
            {
                txtNroOrden.Text = "";
            }
        }

        private void enviarEmail(BEEmpleados jefe, string codigoOrden, BEEmpleados creador)
        {
            string sender = "tp2mvergaray@gmail.com";
            string senderPwd = "123456TP";
            string email = jefe.email;
            string body = "Estimado/a " + jefe.nombre + " " + jefe.apellidos + ", <br/>"+
                "Se envía notificación informando que tiene una orden de devolución pendiente de aprobación. <br/>" +
                "Orden código: " + codigoOrden + "<br/>" +
                "Por favor, ingresar al sistema para realizar las acciones necesarias.";
            if (String.IsNullOrEmpty(email))
                return;
            try
            {
                MailMessage mail = new MailMessage();
                mail.To.Add(email);
                mail.CC.Add(creador.email);
                mail.From = new MailAddress(sender);
                mail.Subject = "sub";

                mail.Body = body;

                mail.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com"; 
                smtp.Credentials = new System.Net.NetworkCredential
                     (sender, senderPwd); 
                smtp.Port = 587;

                smtp.EnableSsl = true;
                smtp.Send(mail);
            }
            catch (Exception ex)
            {
                var a = ex.Message;
            }
        }

        private void BindGrid()
        {
            List<BEDetalleOrdenDevolucion> devolucion = (List<BEDetalleOrdenDevolucion>)Session["devolucion"];
            GridView1.DataSource = devolucion;
            GridView1.DataBind();
        }

        private void BindGrid2()
        {
            List<BEDetalleOrdenDevolucion> devolucion = (List<BEDetalleOrdenDevolucion>)Session["listProdDev"];
            GridView2.DataSource = devolucion;
            GridView2.DataBind();
        }

        private void BindDDL()
        {
            List<BEEmpleados> lista = ordenCon.GetListaJefeFarmacia();
            BEEmpleados defaultEmp = new BEEmpleados();
            defaultEmp.id = -1;
            defaultEmp.nombreCompleto = "Seleccionar un Jefe de Farmacia.";
            lista.Insert(0, defaultEmp);
            ddlJefeFarmacia.DataSource = lista;
            ddlJefeFarmacia.DataTextField = "nombreCompleto";
            ddlJefeFarmacia.DataValueField = "id";
            ddlJefeFarmacia.DataBind();
        }

        private BEOrdenDevolucion GetOrdenxCodTipo(string codigo, int tipo)
        {
            BEOrdenDevolucion orden = ordenCon.GetOrdenxCod(codigo, tipo);

            GridView1.DataSource = orden.detalle_orden;
            GridView1.DataBind();

            return orden;
        }
        
        protected void btnvalidar_Click(object sender, EventArgs e)
        {

            limpiar(true);
            int searchType = rdTipoOrd.Text == "Venta" ? 1 : 2;
            Session["searchType"] = searchType;
            lblLastSearchCode.Text = txtNroOrden.Text;

            if (txtNroOrden.Text != null && txtNroOrden.Text != "")
            {
                lblNroOrdenMsg.Text = "";

                BEOrdenDevolucion orden = GetOrdenxCodTipo(txtNroOrden.Text, searchType);

                if (orden != null && orden.id > 0)
                {
                    if (orden.estado == "Entregado")
                    {
                        infoPanel.Visible = true;
                        btnPreGenerar.Enabled = true;
                        var today = (DateTime.Now).Ticks;
                        long diffTicks = today - orden.fecha.Ticks;
                        string fechaHora = orden.fecha.ToShortDateString() + " - " + orden.fecha.ToShortTimeString();
                        lblFechaConf.Text = lblFechaOrden.Text = fechaHora;
                        lblNroOrden.Text = orden.codigo;
                        if (searchType == 1)
                        {
                            ventaPanel.Visible = true;
                            ventaConfPanel.Visible = true;
                            lblClientConf.Text = lblNombreCliente.Text = orden.cliente.nombres + " " + orden.cliente.apellidos;
                            lblDNIConf.Text = lblNumDocCliente.Text = orden.cliente.num_documento;
                        }
                        else
                        {
                            abastecimientoPanel.Visible = true;
                            abastecimientoConfPanel.Visible = true;
                            lblArea.Text = lblAreaConf.Text = orden.area.descripcion;
                            lblEncargado.Text = lblEncargadoConf.Text = orden.encargado.nombre + " " + orden.encargado.apellidos;
                        }

                        Session["ordenVenta"] = orden;
                        Session["devolucion"] = orden.detalle_orden;

                        // Convertir diferencia a dias
                        if (diffTicks / 864000000000 >= 2)
                        {
                            lblAprobarMsg.Visible = true;
                            lblHourMsg.Text = "La orden tiene más de 48 horas desde su emisión. Se requerirá autorización.";
                            BindDDL();
                            bxJefeFarmacia.Visible = true;
                            bxAprobar.Visible = true;
                            Session["needApproval"] = true;
                        }
                        else
                        {
                            lblHourMsg.Text = "";
                            Session["needApproval"] = false;
                        }
                    }
                    else
                    {
                        lblNroOrdenMsg.Text = "La orden ingresada no ha sido entregada aún.";
                        infoPanel.Visible = false;
                        btnPreGenerar.Enabled = false;
                    }
                }
                else
                {
                    lblNroOrdenMsg.Text = "No se encontró la orden.";
                    infoPanel.Visible = false;
                    btnPreGenerar.Enabled = false;
                }
            }
            else
            {
                lblNroOrdenMsg.Text = "Ingrese un número de orden";
                infoPanel.Visible = false;
                btnPreGenerar.Enabled = false;
            }
        }

        protected void btnGenerar_Click(object sender, EventArgs e)
        {
            BEOrdenDevolucion orden_devolucion =new BEOrdenDevolucion();
            BEOrdenDevolucion orden_venta = (BEOrdenDevolucion) Session["ordenVenta"];
            List<BEDetalleOrdenDevolucion> devolucion = (List<BEDetalleOrdenDevolucion>) Session["listProdDev"];
            BEEmpleados user = (BEEmpleados)Session["user"];

            orden_devolucion.tipo_devolucion = int.Parse(Session["searchType"].ToString());
            orden_devolucion.tipo = 3;
            orden_devolucion.fecha = DateTime.Now;
            bool needApproval = (bool) Session["needApproval"];
            orden_devolucion.estado = needApproval ? "Pendiente" : "Generado";

            if (orden_devolucion.tipo_devolucion == 1)
            {
                orden_devolucion.id_orden_venta = orden_venta.id;
            } else {
                orden_devolucion.id_orden_abastecimiento = orden_venta.id;
            }
            orden_devolucion.motivo = txtMotivo.Text;
            orden_devolucion.detalle_orden = (List<BEDetalleOrdenDevolucion>)Session["listProdDev"];
            orden_devolucion.id_empleado = user.id;
            
            
            if (needApproval) {
                var jefe = (ListItem)Session["approver"];
                orden_devolucion.id_aprobador = int.Parse(jefe.Value);
                
                orden_devolucion = ordenCon.CrearOrdenDevolucion(orden_devolucion);

                BEEmpleados jefeFarmacia = ordenCon.GetEmpleado(orden_devolucion.id_aprobador);
                enviarEmail(jefeFarmacia, orden_devolucion.codigo, user);
            }
            else
            {
                orden_devolucion = ordenCon.CrearOrdenDevolucion(orden_devolucion, true);
            }

            lblOrdenDevId.Text = "Orden de devolución creada con el código: " + orden_devolucion.codigo + ". <br/>Orden creada en estado: " + orden_devolucion.estado;

            limpiar();
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            Session["editing"] = true;
            GridView1.EditIndex = e.NewEditIndex;
            foreach (string key in Session.Keys)
            {
                var test = key;
                var test2 = Session[test];
            }
            BindGrid();
        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            Session["editing"] = false;
            GridView1.EditIndex = -1;
            BindGrid();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Session["editing"] = false;
            lblErrorMsg.Text = "";
            List<BEDetalleOrdenDevolucion> devolucion = (List<BEDetalleOrdenDevolucion>)Session["devolucion"];
            List<BEDetalleOrdenDevolucion> porDevolver = new List<BEDetalleOrdenDevolucion>();

            GridViewRow row = GridView1.Rows[e.RowIndex];
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            int cant_devolver = Convert.ToInt32((row.Cells[4].Controls[0] as TextBox).Text);

            foreach (var item in devolucion)
            {
                if (item.id == id)
                {
                    if (cant_devolver <= item.cantidad)
                    {
                        item.cant_devolver = cant_devolver;
                        Session["devolucion"] = devolucion;

                        GridView1.EditIndex = -1;
                        GridView1.DataSource = devolucion;
                        GridView1.DataBind();
                    }
                    else
                    {
                        lblErrorMsg.Text = "La cantidad ingresada a devolver debe ser menor o igual a la cantidad vendida.";
                    }
                }   
            }

            // Contar productos de la lista a ser devueltos
            foreach (var item in devolucion)
            {
                if (item.cant_devolver > 0)
                {
                    porDevolver.Add(item);
                }
            }
            Session["listProdDev"] = porDevolver;
            Session["prodCount"] = porDevolver.Count;

            BindGrid2();
        }

        protected void OnDDLSelectionChange(object sender, EventArgs e)
        {
            var a =  ddlJefeFarmacia.SelectedItem;
            lblAprobarPor.Text = a.Text;
            Session["approver"] = a;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {

        }
    }
}
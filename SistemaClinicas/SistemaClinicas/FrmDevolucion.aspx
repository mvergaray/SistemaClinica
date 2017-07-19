<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmDevolucion.aspx.cs" Inherits="ComprobantesRetencion.header" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server"  class="form-horizontal">
    <div class="content row">
        <div class="col-md-12">
            <div class="tab-content">
                <div class="tab-pane settings active">
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3>Generar Devolución de Productos</h3>
                        </div>
                        <div class="box-body">
                            <div class="box-group">
                                <div class="form-group">
                                    <asp:Label Text="" ID="lblOrdenDevId" runat="server" CssClass="text-green col-sm-12" />
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Tipo de Orden:</label>
                                    <div class="col-sm-4">
                                        <asp:RadioButtonList ID="rdTipoOrd" runat="server">
                                            <asp:ListItem Text="Venta" Value="Venta" Selected="True" />
                                            <asp:ListItem Text="Abastecimiento" Value="Abastecimiento" />
                                        </asp:RadioButtonList>
                                            
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Nro. de Orden:</label>
                                    <div class="col-sm-4">
                                        <asp:TextBox name="txtNroOrden" CssClass="form-control" id="txtNroOrden" runat="server" placeholder="Nro. de Orden" ></asp:TextBox>
                                        <asp:Label runat="server" ID="lblNroOrdenMsg" CssClass="text-red"></asp:Label><br />
                                        <asp:Label Id="lblLastSearchCode"  runat="server" CssClass="hidden"></asp:Label>
                                        <asp:Label Id="lblLastSearchType"  runat="server" CssClass="hidden"></asp:Label>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:Button type="submit" CssClass="btn btn-default" Text="Validar Orden" runat="server" ID="btnvalidar" OnClick="btnvalidar_Click"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-6 col-sm-2">
                                        <button type="submit" class="btn btn-default">Buscar Orden</button>
                                    </div>
                                </div>
                                <div id="infoPanel" runat="server">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" >Nro. Orden:</label>
                                        <asp:Label CssClass="col-sm-4 form-control-static" ID="lblNroOrden" runat="server">-</asp:Label>
                                    </div>
                                    <div id="ventaPanel" runat="server">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label" >Cliente:</label>
                                            <asp:Label CssClass="col-sm-4 form-control-static" ID="lblNombreCliente" runat="server">-</asp:Label>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">DNI Cliente:</label>
                                            <asp:Label CssClass="col-sm-4 form-control-static" ID="lblNumDocCliente" runat="server">-</asp:Label>
                                        </div>
                                    </div>
                                    <div id="abastecimientoPanel" runat="server">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label" >Area:</label>
                                            <asp:Label CssClass="col-sm-4 form-control-static" ID="lblArea" runat="server">-</asp:Label>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Encargado:</label>
                                            <asp:Label CssClass="col-sm-4 form-control-static" ID="lblEncargado" runat="server">-</asp:Label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Fecha de Orden:</label>
                                        <asp:Label CssClass="col-sm-4 form-control-static" ID="lblFechaOrden" runat="server">-</asp:Label>
                                        <asp:Label runat="server" ID="lblHourMsg" CssClass="text-red col-sm-offset-2 col-sm-10 text-bold"></asp:Label>
                                    </div>

                                    <div class="form-group" id="bxJefeFarmacia" runat="server">
                                        <label class="col-sm-2 control-label">Jefe de Farmacia:</label>
                                        <div class="col-sm-4">
                                            <asp:DropDownList ID="ddlJefeFarmacia" CssClass="form-control" OnSelectedIndexChanged="OnDDLSelectionChange"
                                                AutoPostBack="true" runat="server">
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="form-group col-sm-12">
                                        <div class="col-sm-offset-1">
                                            <asp:Label runat="server" ID="lblErrorMsg" CssClass="text-red"></asp:Label>
                                        </div>
                                            
                                        <asp:GridView ID="GridView1" runat="server" DataKeyNames="id" autogeneratecolumns="false" OnRowEditing="OnRowEditing"
                                            OnRowCancelingEdit="OnRowCancelingEdit" OnRowUpdating="OnRowUpdating" CssClass="col-sm-offset-1"
                                            emptydatatext="No se encontraron datos de detalle.">
                                            <columns>
                                                <asp:boundfield datafield="codigoProdGen" headertext="Código" ReadOnly="true"/>
                                                <asp:boundfield datafield="descripcionGen" headertext="Nombre" ReadOnly="true"/>
                                                <asp:boundfield datafield="cantidad" headertext="Cantidad" ReadOnly="true" ItemStyle-CssClass="text-right"/>
                                                <asp:boundfield datafield="monto" headertext="Monto S/." ReadOnly="true" ItemStyle-CssClass="text-right"/>
                                                <asp:boundfield datafield="cant_devolver" headertext="Cant. a Devolver"  ItemStyle-CssClass="text-right" ControlStyle-CssClass="number"/>
                                                <asp:CommandField EditText="Seleccionar" ShowEditButton="true" UpdateText="Guardar" CancelText="Cancelar" />
                                            </columns>
                                        </asp:GridView>
                                    </div>
                                    <br /><br /><br />
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Motivo:</label>
                                        <div class="col-sm-4">
                                            <asp:TextBox ID="txtMotivo" TextMode="multiline" Columns="50" Rows="5" runat="server"></asp:TextBox>
                                            <asp:Label runat="server" ID="lblMotivoError" CssClass="text-red"></asp:Label>
                                        </div>
                                    </div>
                                </div>

                                <div id="buscarOrdenPanel" runat="server" visible="false">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">DNI Cliente:</label>
                                        <div class="col-sm-4">
                                            <asp:TextBox  CssClass="form-control" id="TextBox1" runat="server" placeholder="DNI Cliente" ></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Nombre Cliente:</label>
                                        <div class="col-sm-4">
                                            <asp:TextBox CssClass="form-control" id="TextBox2" runat="server" placeholder="Nombre Cliente" ></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Fecha:</label>
                                        <div class="col-sm-4">
                                            <asp:TextBox CssClass="form-control" id="TextBox3" runat="server" placeholder="Fecha" ></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-6 col-sm-2">
                                            <asp:Button type="submit" CssClass="btn btn-default" Text="Buscar Orden" runat="server" ID="btnBuscar" OnClick="btnBuscar_Click"/>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <div class="col-sm-offset-10 col-sm-2">

                                        <asp:Button type="submit" CssClass="btn btn-success" Text="Generar Orden" 
                                            ID="btnPreGenerar" runat="server"
                                            UseSubmitBehavior="false"
                                            OnClientClick="validarOrdenDev(); return false;"/>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Confirmar Orden de Devolución</h4>
          </div>
          <div class="modal-body">
              <div>
                  Orden de devolución a crear con los siguientes datos:
              </div>
              <div id="lblAprobarMsg" runat="server">
                  * La orden se generará en estado Pendiente hasta que sea aprobada.<br />
                  * Se enviará un correo al Jefe de Farmacia seleccionado solicitando aprobación de la orden.
              </div>
            
            <div id="ventaConfPanel" runat="server">
                <div class="form-group">
                    <label class="col-sm-3 control-label" >Cliente:</label>
                    <asp:Label CssClass="col-sm-6 form-control-static" ID="lblClientConf" runat="server">-</asp:Label>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">DNI Cliente:</label>
                    <asp:Label CssClass="col-sm-6 form-control-static" ID="lblDNIConf" runat="server">-</asp:Label>
                </div>
            </div>
            <div id="abastecimientoConfPanel" runat="server">
                <div class="form-group">
                    <label class="col-sm-3 control-label" >Area:</label>
                    <asp:Label CssClass="col-sm-4 form-control-static" ID="lblAreaConf" runat="server">-</asp:Label>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Encargado:</label>
                    <asp:Label CssClass="col-sm-4 form-control-static" ID="lblEncargadoConf" runat="server">-</asp:Label>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">Fecha de Orden:</label>
                <asp:Label CssClass="col-sm-6 form-control-static" ID="lblFechaConf" runat="server">-</asp:Label>
            </div>

            <div class="form-group" id="bxAprobar" runat="server">
                <label class="col-sm-3 control-label">Aprobación pendiente por:</label>
                <asp:Label CssClass="col-sm-6 form-control-static" ID="lblAprobarPor" runat="server">-</asp:Label>
            </div>
            <div class="form-group col-sm-12">
                <asp:GridView ID="GridView2" runat="server" DataKeyNames="id" autogeneratecolumns="false" OnRowEditing="OnRowEditing"
                    OnRowCancelingEdit="OnRowCancelingEdit" OnRowUpdating="OnRowUpdating"
                    emptydatatext="No se encontraron datos de detalle.">
                    <columns>
                        <asp:boundfield datafield="codigoProdGen" headertext="Código" ReadOnly="true"/>
                        <asp:boundfield datafield="descripcionGen" headertext="Nombre" ReadOnly="true"/>
                        <asp:boundfield datafield="cantidad" headertext="Cantidad" ReadOnly="true" ItemStyle-CssClass="text-right"/>
                        <asp:boundfield datafield="monto" headertext="Monto S/." ReadOnly="true" ItemStyle-CssClass="text-right"/>
                        <asp:boundfield datafield="cant_devolver" headertext="Cant. a Devolver"  ItemStyle-CssClass="text-right" ControlStyle-CssClass="number"/>
                    </columns>
                </asp:GridView>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
            <asp:Button type="submit" CssClass="btn btn-success" Text="Aceptar" runat="server" ID="btnGenerar" OnClick="btnGenerar_Click"/>
          </div>
        </div>
      </div>
    </div>
    </form>
    <script type="text/javascript">
        function validarOrdenDev() {
            var prodCount = parseInt('<%= Session["prodCount"] %>'),
                isEditing = '<%= Session["editing"] %>',
                lastSearchCode = $('#ContentPlaceHolder1_lblLastSearchCode').text(),
                motivo = $('#ContentPlaceHolder1_txtMotivo').val(),
                lblError = $('#ContentPlaceHolder1_lblErrorMsg'),
                lblMotivoError = $('#ContentPlaceHolder1_lblMotivoError'),
                needApproval = [true, "true", "True"].indexOf('<%= Session["needApproval"] %>') >= 0,
                approverId = $('#ContentPlaceHolder1_ddlJefeFarmacia').val();


            if ([true, "true", "True"].indexOf(isEditing) >= 0) {
                lblError.text('Termine editar la cantidad a devolver antes de generar la orden.')
            } else {
                if (lastSearchCode) {
                    if ( (needApproval && approverId > 0) || !needApproval) {
                        if (prodCount) {
                            if (motivo) {
                                lblError.text('');
                                openModal();
                            } else {
                                lblMotivoError.text('Debe ingresar el motivo de devolución.');
                            }

                        } else {
                            lblError.text('Debe seleccionar al menos un producto a ser devuelto.');
                        }
                    } else {
                        lblError.text('Debe seleccionar un jefe de farmacia que apruebe la solicitud.');
                    }
                } else {
                    $('#ContentPlaceHolder1_lblNroOrdenMsg').text('Debe seleccionar una orden de venta o abastecimiento a ser devuelta.');
                }
            }
        }
        function openModal() {
            $('#myModal').modal('show');
        }
        $(".number").keydown(function (event) {
            if (event.keyCode == 46 || event.keyCode == 8) {
            } else {
                if (event.keyCode < 95) {
                    if (event.keyCode < 48 || event.keyCode > 57) {
                        event.preventDefault();
                    }
                } else {
                    if (event.keyCode < 96 || event.keyCode > 105) {
                        event.preventDefault();
                    }
                }
            }
        });
    </script>
</asp:Content>

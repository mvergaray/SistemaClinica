<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmDevolucion.aspx.cs" Inherits="ComprobantesRetencion.header" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                                <form id="form1" runat="server"  class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Tipo de Orden:</label>
                                        <div class="col-sm-4">
                                            <label class="radio-inline">
                                                <asp:RadioButton ID="rdTipoOrden" GroupName="tipoOrden" runat="server" Text="Venta" Checked="true" />
                                            </label>
                                            <label class="radio-inline">
                                              <asp:RadioButton ID="RadioButton2" GroupName="tipoOrden" runat="server" Text="Abastecimiento" />
                                            </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Nro. de Orden:</label>
                                        <div class="col-sm-4">
                                            <asp:TextBox name="txtNroOrden" CssClass="form-control" id="txtNroOrden" runat="server" placeholder="Nro. de Orden" ></asp:TextBox>
                                            <asp:Label Id="lblLastSearchCode" Visible="false" runat="server"></asp:Label>
                                            <asp:Label Id="lblLastSearchType" Visible="false" runat="server"></asp:Label>
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

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" >Cliente:</label>
                                        <asp:Label CssClass="col-sm-4 form-control-static" ID="lblNombreCliente" runat="server">-</asp:Label>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">DNI Cliente:</label>
                                        <asp:Label CssClass="col-sm-4 form-control-static" ID="lblNumDocCliente" runat="server">-</asp:Label>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Fecha de Orden:</label>
                                        <asp:Label CssClass="col-sm-4 form-control-static" ID="lblFechaOrden" runat="server">-</asp:Label>
                                    </div>

                                    <div class="form-group col-sm-12">
                                        <asp:GridView ID="GridView1" runat="server" DataKeyNames="id" autogeneratecolumns="false" OnRowEditing="OnRowEditing"
                                            OnRowCancelingEdit="OnRowCancelingEdit" OnRowUpdating="OnRowUpdating" AutoGenerateEditButton="true"
                                            emptydatatext="No hay datos.">
                                            <columns>
                                              <asp:boundfield datafield="codigo" headertext="Código" ReadOnly="true"/>
                                              <asp:boundfield datafield="producto.descripcion" headertext="Producto" ReadOnly="true"/>
                                              <asp:boundfield datafield="preparado.nombre" headertext="Preparado" ReadOnly="true"/>
                                              <asp:boundfield datafield="cantidad" headertext="Cantidad" ReadOnly="true"/>
                                              <asp:boundfield datafield="monto" headertext="Precio" ReadOnly="true"/>
                                              <asp:boundfield datafield="cant_devolver" headertext="Cantidad a Devolver"/>
                                            </columns>
                                        </asp:GridView>
                                    </div>

                                    <br /><br /><br />
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">Motivo:</label>
                                        <div class="col-sm-4">
                                            <textarea class="form-control" rows="3"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-10 col-sm-2">
                                          <asp:Button type="submit" CssClass="btn btn-success" Text="Generar Orden" runat="server" ID="btnGenerar" OnClick="btnGenerar_Click"/>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

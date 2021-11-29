<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="Devoluciones.aspx.cs" Inherits="Biblioteca.Devoluciones.Devoluciones" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CSSContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

        <h2
        class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">Devolcuiones
    </h2>
    <br />

    <p style="font-size: 12px;">Crea y gestiona todos tus Devolcuiones</p>
    <br />

    <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#exampleModal">
     + Registrar Devolución
</button><br /><br />



    <dx:ASPxGridView runat="server" CssClass="table" Theme="PlasticBlue" AutoGenerateColumns="False" DataSourceID="DevolucionesDS" KeyFieldName="Clave">
    <Settings ShowFilterRow="True" ShowGroupPanel="True" />
    <SettingsSearchPanel Visible="True" />
    <Columns>
        <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="Clave" ReadOnly="True" VisibleIndex="1">
            <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn FieldName="Fecha" VisibleIndex="2">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn FieldName="Estudiante" ReadOnly="True" VisibleIndex="3">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Libro" VisibleIndex="4">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="5">
        </dx:GridViewDataTextColumn>
    </Columns>
</dx:ASPxGridView>

   

    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Registrar Devoluciones</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <strong>Fecha: </strong><br />
          <dx:ASPxDateEdit runat="server" ID="dtp_fecha" CssClass="form-control"></dx:ASPxDateEdit><br />
          <strong>Estudiante:</strong><br />
          <asp:DropDownList runat="server" ID="cb_estudiante" CssClass="form-control" DataSourceID="EstudiantesDS" DataValueField="id_estudiante" DataTextField="nombre"></asp:DropDownList><br />
          <strong>Libros: </strong>
           <asp:DropDownList runat="server" ID="cb_libros" CssClass="form-control" DataSourceID="LibrosDS" DataValueField="id_libro" DataTextField="nombre"></asp:DropDownList><br />

      </div>
      <div class="modal-footer">
       
       <dx:ASPxButton runat="server" ID="btn_registro" Theme="MaterialCompact" Text="REGISTRA DEVOLUCIÓN" OnClick="btn_registro_Click"></dx:ASPxButton>
      </div>
    </div>
  </div>
</div>




    <asp:SqlDataSource ID="LibrosDS" runat="server" ConnectionString="<%$ ConnectionStrings:bibliotecaConnectionString %>" SelectCommand="SELECT [id_libro], [nombre] FROM [Libro]"></asp:SqlDataSource>
       <asp:SqlDataSource ID="EstudiantesDS" runat="server" ConnectionString="<%$ ConnectionStrings:bibliotecaConnectionString %>" SelectCommand="SELECT [id_estudiante], [nombre] FROM [Estudiante]"></asp:SqlDataSource>


    <asp:SqlDataSource ID="DevolucionesDS" runat="server" ConnectionString="<%$ ConnectionStrings:bibliotecaConnectionString %>" SelectCommand="SELECT 

d.id_devolucion AS Clave,
d.fechaDevolucion AS Fecha,
CONCAT(e.nombre,' ',e.apellido) AS Estudiante,
l.nombre AS Libro,
u.Usuario

FROM Devoluciones AS d
INNER JOIN Estudiante AS e
ON d.id_estudiante=e.id_estudiante
INNER JOIN Libro AS l
ON d.id_libro=l.id_libro
INNER JOIN Usuarios AS u
ON d.id_usuario=u.id_usuario"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JSContent" runat="server">
</asp:Content>

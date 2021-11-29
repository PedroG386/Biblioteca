<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="prestamos.aspx.cs" Inherits="Biblioteca.Prestamos.prestamos" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CSSContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    
      <h2
        class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">Prestamos
    </h2>
    <br />

    <p style="font-size: 12px;">Crea y gestiona todos tus prestamos.</p>
    <br />

    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal">
        + Agrega Prestamo
    </button><br /><br />

    <dx:ASPxGridView runat="server" CssClass="table" ID="GV_Prestamos" Theme="PlasticBlue" AutoGenerateColumns="False" DataSourceID="PrestamosDS" KeyFieldName="Clave">
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="Clave" ReadOnly="True" VisibleIndex="0">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Estudiante" ReadOnly="True" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Libro" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="fechaPrestamo" VisibleIndex="3">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Observaciones" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>

    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Agregar Prestamo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <strong>Estudiante: </strong><br />
          <asp:DropDownList runat="server" ID="cb_estudiantes" CssClass="form-control" DataSourceID="EstudianteDS" DataTextField="nombre" DataValueField="id_estudiante"></asp:DropDownList><br />
          <strong>Libros: </strong><br />
          <asp:DropDownList runat="server" ID="cb_libros" CssClass="form-control" DataSourceID="LibrosDS" DataTextField="nombre" DataValueField="id_libro"></asp:DropDownList><br />
          <strong>Fecha:</strong><br />
          <dx:ASPxDateEdit runat="server" ID="dtp_fecha" Theme="PlasticBlue" CssClass="form-control"></dx:ASPxDateEdit><br />
          <strong>Observaciones:</strong><br />
          <dx:ASPxTextBox runat="server" ID="inp_observaciones" CssClass="form-control"></dx:ASPxTextBox>

      </div>
      <div class="modal-footer">
   
        <dx:ASPxButton runat="server" ID="btn_genera" Theme="MaterialCompact" Text="REGISTRA PRESTAMO" OnClick="btn_genera_Click"></dx:ASPxButton>
      </div>
    </div>
  </div>
</div>








    <asp:SqlDataSource ID="EstudianteDS" runat="server" ConnectionString="<%$ ConnectionStrings:bibliotecaConnectionString %>" SelectCommand="SELECT [id_estudiante], [nombre] FROM [Estudiante]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="LibrosDS" runat="server" ConnectionString="<%$ ConnectionStrings:bibliotecaConnectionString %>" SelectCommand="SELECT [id_libro], [nombre] FROM [Libro]"></asp:SqlDataSource>


    <asp:SqlDataSource ID="PrestamosDS" runat="server" ConnectionString="<%$ ConnectionStrings:bibliotecaConnectionString %>" SelectCommand="SELECT 
p.id_prestamo AS Clave,
CONCAT(e.nombre,' ',e.apellido) AS Estudiante,
l.nombre AS Libro,
p.fechaPrestamo,
p.Observaciones,
u.Usuario
FROM 
Prestamos AS p
INNER JOIN Estudiante AS e
ON p.id_estudiante=e.id_estudiante
INNER JOIN Libro AS l
ON p.id_libro = l.id_libro
INNER JOIN Usuarios AS u
ON p.id_usuario=u.id_usuario
"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JSContent" runat="server">
</asp:Content>

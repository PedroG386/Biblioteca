<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="libros.aspx.cs" Inherits="Biblioteca.Libros.libros" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CSSContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2
        class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">Libros
    </h2>
    <br />

    <p style="font-size: 12px;">Crea y gestiona todos tus libros</p>
    <br />

    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
        + Agrega Libro
    </button>

    <br /><br />
    <dx:ASPxGridView runat="server" ID="GV_libros" CssClass="table" Theme="PlasticBlue" AutoGenerateColumns="False" DataSourceID="LibrosDS" KeyFieldName="Clave">
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Clave" ReadOnly="True" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Libro" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Editorial" VisibleIndex="3">
                <PropertiesComboBox DataSourceID="Editoriales" TextField="nombre" ValueField="id_editorial">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Autor" ReadOnly="True" VisibleIndex="4">
                <PropertiesComboBox DataSourceID="AutoresDS" TextField="Autor" ValueField="id_autor"></PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataDateColumn FieldName="fechaLanzamiento" VisibleIndex="5">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataComboBoxColumn Caption="Genero" FieldName="Genero" VisibleIndex="6">
            </dx:GridViewDataComboBoxColumn>
        </Columns>
    </dx:ASPxGridView>


    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Registra Libro</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <strong>Nombre del libro:</strong><br />
          <asp:TextBox runat="server" ID="inp_nombre" CssClass="form-control"></asp:TextBox><br />
           <strong>Autor:</strong><br />
          <asp:DropDownList runat="server" ID="cb_autores" CssClass="form-control"  DataSourceID="AutoresDS" DataTextField="Autor" DataValueField="id_autor"></asp:DropDownList>
          <strong>Editorial:</strong><br />
          <asp:DropDownList runat="server" ID="cb_editoriales" CssClass="form-control" DataSourceID="Editoriales" DataTextField="nombre" DataValueField="id_editorial"></asp:DropDownList>
          <strong>Fecha Lanzamiento:</strong><br />
          <dx:ASPxDateEdit runat="server" ID="dtp_fecha" Theme="PlasticBlue" CssClass="form-control"></dx:ASPxDateEdit>
          <strong>Género:</strong><br />
          <asp:TextBox runat="server" ID="inp_generp" CssClass="form-control"></asp:TextBox><br />
      </div>
      <div class="modal-footer">
      
        <dx:ASPxButton runat="server" ID="btn_inserta" Theme="MaterialCompact" Width="100" Text="REGISTRAR LIBRO" OnClick="btn_inserta_Click"></dx:ASPxButton>
      </div>
    </div>
  </div>
</div>







    <asp:SqlDataSource ID="LibrosDS" runat="server" ConnectionString="<%$ ConnectionStrings:bibliotecaConnectionString %>" SelectCommand="SELECT 
l.id_libro AS Clave,
l.nombre AS Libro,
e.nombre AS Editorial,
CONCAT(a.nombre,' ',a.apellido) AS Autor,
l.fechaLanzamiento,
l.Genero

FROM 

Libro AS l
INNER JOIN Autores AS a
ON l.id_autor=a.id_autor
INNER JOIN Editoriales AS e
ON l.id_editorial=e.id_editorial"
        UpdateCommand="

UPDATE Libro 
SET [nombre] =@nombre,
[id_autor] =@id_autor,
[id_editorial] =@id_editorial,
[fechaLanzamiento] =@fechaLanzamiento,
[Genero] =@Genero 
WHERE
	[id_libro] =@id_libro">
        <UpdateParameters>
            <asp:Parameter Name="nombre" />
            <asp:Parameter Name="id_autor" />
            <asp:Parameter Name="id_editorial" />
            <asp:Parameter Name="fechaLanzamiento" />
            <asp:Parameter Name="Genero" />
            <asp:Parameter Name="id_libro" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Editoriales" runat="server" ConnectionString="<%$ ConnectionStrings:bibliotecaConnectionString %>" SelectCommand="SELECT [id_editorial], [nombre] FROM [Editoriales]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="AutoresDS" runat="server" ConnectionString="<%$ ConnectionStrings:bibliotecaConnectionString %>" SelectCommand="SELECT [id_autor], CONCAT(nombre, ' ',apellido) AS Autor FROM [Autores]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JSContent" runat="server">
</asp:Content>

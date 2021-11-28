<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="Autores.aspx.cs" Inherits="Biblioteca.Libros.Autores" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CSSContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

      <h2
        class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">Autores
    </h2>
    <br />

    <p style="font-size: 12px;">Crea y gestiona todos tus Autores</p>
    <br />

   <dx:ASPxGridView runat="server" ID="GV_autores" CssClass="table" AutoGenerateColumns="False" DataSourceID="AutoresDS" KeyFieldName="id_autor" Theme="PlasticBlue">
       <Settings ShowFilterRow="True" ShowGroupPanel="True" />
       <SettingsSearchPanel Visible="True" />
       <Columns>
           <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
           </dx:GridViewCommandColumn>
           <dx:GridViewDataTextColumn FieldName="id_autor" ReadOnly="True" VisibleIndex="1">
               <EditFormSettings Visible="False" />
           </dx:GridViewDataTextColumn>
           <dx:GridViewDataTextColumn FieldName="nombre" VisibleIndex="2">
           </dx:GridViewDataTextColumn>
           <dx:GridViewDataTextColumn FieldName="apellido" VisibleIndex="3">
           </dx:GridViewDataTextColumn>
           <dx:GridViewDataTextColumn FieldName="nacionalidad" VisibleIndex="4">
           </dx:GridViewDataTextColumn>
       </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="AutoresDS" runat="server" ConnectionString="<%$ ConnectionStrings:bibliotecaConnectionString %>" DeleteCommand="DELETE FROM [Autores] WHERE [id_autor] = @id_autor" InsertCommand="INSERT INTO [Autores] ([nombre], [apellido], [nacionalidad]) VALUES (@nombre, @apellido, @nacionalidad)" SelectCommand="SELECT * FROM [Autores]" UpdateCommand="UPDATE [Autores] SET [nombre] = @nombre, [apellido] = @apellido, [nacionalidad] = @nacionalidad WHERE [id_autor] = @id_autor">
        <DeleteParameters>
            <asp:Parameter Name="id_autor" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="apellido" Type="String" />
            <asp:Parameter Name="nacionalidad" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="apellido" Type="String" />
            <asp:Parameter Name="nacionalidad" Type="String" />
            <asp:Parameter Name="id_autor" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JSContent" runat="server">
</asp:Content>

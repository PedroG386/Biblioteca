<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="Biblioteca.Libros.edit" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CSSContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

      <h2
              class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
            >
              Editoriales
            </h2><br />
                  <p style="font-size:12px;">Crea y gestiona todas las editoriales, conforme los libros de tu biblioteca.</p><br />
               


    <dx:ASPxGridView CssClass="table table-striped" runat="server" ID="GV_Editoriales" Theme="PlasticBlue" AutoGenerateColumns="False" DataSourceID="EditorialesDS" KeyFieldName="id_editorial" Width="681px">
                      <Settings ShowFilterRow="True" ShowGroupPanel="True" />
                      <SettingsSearchPanel Visible="True" />
                      <Columns>
                          <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                          </dx:GridViewCommandColumn>
                          <dx:GridViewDataTextColumn FieldName="id_editorial" ReadOnly="True" VisibleIndex="1">
                              <EditFormSettings Visible="False" />
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="nombre" VisibleIndex="2">
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="Pais" VisibleIndex="3">
                          </dx:GridViewDataTextColumn>
                          <dx:GridViewDataTextColumn FieldName="Año" VisibleIndex="4">
                          </dx:GridViewDataTextColumn>
                      </Columns>
                  </dx:ASPxGridView>

   
    <asp:SqlDataSource ID="EditorialesDS" runat="server" ConnectionString="<%$ ConnectionStrings:bibliotecaConnectionString %>" SelectCommand="SELECT * FROM [Editoriales]" DeleteCommand="DELETE FROM [Editoriales] WHERE [id_editorial] = @id_editorial" InsertCommand="INSERT INTO [Editoriales] ([nombre], [Pais], [Año]) VALUES (@nombre, @Pais, @Año)" UpdateCommand="UPDATE [Editoriales] SET [nombre] = @nombre, [Pais] = @Pais, [Año] = @Año WHERE [id_editorial] = @id_editorial">
        <DeleteParameters>
            <asp:Parameter Name="id_editorial" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="Pais" Type="String" />
            <asp:Parameter Name="Año" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="Pais" Type="String" />
            <asp:Parameter Name="Año" Type="Int32" />
            <asp:Parameter Name="id_editorial" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JSContent" runat="server">
</asp:Content>

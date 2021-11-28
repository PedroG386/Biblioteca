<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="estudiantes.aspx.cs" Inherits="Biblioteca.Estudiantes.estudiantes" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CSSContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
      <h2
        class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">Estudiantes
    </h2>
    <br />

    <p style="font-size: 12px;">Crea y gestiona todos tus Estudiantes</p>
    <br />

    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
        + Agregar Estudiante
    </button><br /><br />


    <dx:ASPxGridView runat="server" ID="GV_Eatudiantes" Theme="PlasticBlue" CssClass="table" AutoGenerateColumns="False" DataSourceID="EstudiantesDS" KeyFieldName="id_estudiante">
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="id_estudiante" ReadOnly="True" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="nombre" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="apellido" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="fechaIngreso" VisibleIndex="4">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="NoControl" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Escuela" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Edad" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="EstudiantesDS" runat="server" ConnectionString="<%$ ConnectionStrings:bibliotecaConnectionString %>" DeleteCommand="DELETE FROM [Estudiante] WHERE [id_estudiante] = @id_estudiante" InsertCommand="INSERT INTO [Estudiante] ([nombre], [apellido], [fechaIngreso], [NoControl], [Escuela], [Edad]) VALUES (@nombre, @apellido, @fechaIngreso, @NoControl, @Escuela, @Edad)" SelectCommand="SELECT * FROM [Estudiante]" UpdateCommand="UPDATE [Estudiante] SET [nombre] = @nombre, [apellido] = @apellido, [fechaIngreso] = @fechaIngreso, [NoControl] = @NoControl, [Escuela] = @Escuela, [Edad] = @Edad WHERE [id_estudiante] = @id_estudiante">
        <DeleteParameters>
            <asp:Parameter Name="id_estudiante" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="apellido" Type="String" />
            <asp:Parameter DbType="Date" Name="fechaIngreso" />
            <asp:Parameter Name="NoControl" Type="String" />
            <asp:Parameter Name="Escuela" Type="String" />
            <asp:Parameter Name="Edad" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="nombre" Type="String" />
            <asp:Parameter Name="apellido" Type="String" />
            <asp:Parameter DbType="Date" Name="fechaIngreso" />
            <asp:Parameter Name="NoControl" Type="String" />
            <asp:Parameter Name="Escuela" Type="String" />
            <asp:Parameter Name="Edad" Type="Int32" />
            <asp:Parameter Name="id_estudiante" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>



    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Agregar Estudiante</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <strong>Nombre:</strong><br />
          <asp:TextBox runat="server" ID="inp_nombre" CssClass="form-control"></asp:TextBox><br />
          <strong>Apellidos:</strong><br />
          <asp:TextBox runat="server" ID="inp_apellidos" CssClass="form-control"></asp:TextBox><br />
          <strong>Fecha de Ingreso: </strong><br />
          <dx:ASPxDateEdit runat="server" ID="dtp_fechaIngreso" Theme="PlasticBlue" CssClass="form-control"></dx:ASPxDateEdit>
           <strong>Número Control:</strong><br />
          <asp:TextBox runat="server" ID="inp_Ncontrol" CssClass="form-control"></asp:TextBox><br />
           <strong>Escuela:</strong><br />
          <asp:TextBox runat="server" ID="inp_escuela" CssClass="form-control"></asp:TextBox><br />
           <strong>Edad:</strong><br />
          <asp:TextBox runat="server" ID="inp_edad" CssClass="form-control"></asp:TextBox><br />

      </div>
      <div class="modal-footer">
        
     <dx:ASPxButton runat="server" ID="btn_registra" Theme="MaterialCompact" OnClick="btn_registra_Click" Text="REGISTRAR ESTUDIANTE"></dx:ASPxButton>
      </div>
    </div>
  </div>
</div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JSContent" runat="server">
</asp:Content>

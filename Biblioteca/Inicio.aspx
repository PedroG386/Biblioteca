<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="Biblioteca.defualt" %>

<%@ Register Assembly="DevExpress.Web.v20.1, Version=20.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="CSSContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    
       <div class="grid gap-6 mb-8 md:grid-cols-2 xl:grid-cols-4">
              <!-- Card -->
              <div
                class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
              >
                <div
                  class="p-3 mr-4 text-orange-500 bg-orange-100 rounded-full dark:text-orange-100 dark:bg-orange-500"
                >
                 <span class="material-icons">west</span>
                </div>
                <div>
                  <p
                    class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400"
                  >
                    Prestamos
                  </p>
                  <p
                    class="text-lg font-semibold text-gray-700 dark:text-gray-200"
                  >
                    <asp:Label runat="server" ID="lbl_numPrestamos"></asp:Label>
                  </p>
                </div>
              </div>
              <!-- Card -->
              <div
                class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
              >
                <div
                  class="p-3 mr-4 text-green-500 bg-green-100 rounded-full dark:text-green-100 dark:bg-green-500"
                >
                  <span class="material-icons">east</span>
                </div>
                <div>
                  <p
                    class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400"
                  >
                   Devoluciones
                  </p>
                  <p
                    class="text-lg font-semibold text-gray-700 dark:text-gray-200"
                  >
                        <asp:Label runat="server" ID="lbl_numeDevoluciones"></asp:Label>
                    
                  </p>
                </div>
              </div>
              <!-- Card -->
              <div
                class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
              >
                <div
                  class="p-3 mr-4 text-blue-500 bg-blue-100 rounded-full dark:text-blue-100 dark:bg-blue-500"
                >
                  
                      <span class="material-icons">school</span>
                </div>
                <div>
                  <p
                    class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400"
                  >
                    Estudiantes
                  </p>
                  <p
                    class="text-lg font-semibold text-gray-700 dark:text-gray-200"
                  >
                     <asp:Label runat="server" ID="lbl_numEstudiantes"></asp:Label>
                  </p>
                </div>
              </div>
              <!-- Card -->
              <div
                class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
              >
                <div
                  class="p-3 mr-4 text-teal-500 bg-teal-100 rounded-full dark:text-teal-100 dark:bg-teal-500"
                >
                  <span class="material-icons">auto_stories</span>

  
                </div>
                <div>
                  <p
                    class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400"
                  >
                    Libros
                  </p>
                  <p
                    class="text-lg font-semibold text-gray-700 dark:text-gray-200"
                  >
                     <asp:Label runat="server" ID="lbl_numLibros"></asp:Label>
                  </p>
                </div>
              </div>
            </div>
    <br />

      <h4
        > Ultimo Prestamo Registrado
    </h4><br />
    <dx:ASPxGridView ID="GV_UltimoPrestamo" CssClass="table" runat="server" Theme="PlasticBlue" AutoGenerateColumns="False" DataSourceID="UltimoPrestamoDS" KeyFieldName="Clave">
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Clave" ReadOnly="True" VisibleIndex="1">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Estudiante" ReadOnly="True" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Libro" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="fechaPrestamo" VisibleIndex="4">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Observaciones" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <br />
      <h4
        > Ultima Devolución Registrada
    </h4><br />
  <dx:ASPxGridView ID="GV_UltimoDevoluciones"  CssClass="table" runat="server" Theme="PlasticBlue" AutoGenerateColumns="False" DataSourceID="UltimaDevolucionDS" KeyFieldName="Clave">
      <Settings ShowFilterRow="True" ShowGroupPanel="True" />
      <SettingsSearchPanel Visible="True" />
      <Columns>
          <dx:GridViewDataTextColumn FieldName="Clave" ReadOnly="True" VisibleIndex="0">
              <EditFormSettings Visible="False" />
          </dx:GridViewDataTextColumn>
          <dx:GridViewDataDateColumn FieldName="Fecha" VisibleIndex="1">
          </dx:GridViewDataDateColumn>
          <dx:GridViewDataTextColumn FieldName="Estudiante" ReadOnly="True" VisibleIndex="2">
          </dx:GridViewDataTextColumn>
          <dx:GridViewDataTextColumn FieldName="Libro" VisibleIndex="3">
          </dx:GridViewDataTextColumn>
          <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="4">
          </dx:GridViewDataTextColumn>
      </Columns>
    </dx:ASPxGridView>


    <asp:SqlDataSource ID="UltimoPrestamoDS" runat="server" ConnectionString="<%$ ConnectionStrings:bibliotecaConnectionString %>" SelectCommand="SELECT 

TOP 1
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

ORDER BY p.fechaPrestamo DESC"></asp:SqlDataSource>
     <asp:SqlDataSource ID="UltimaDevolucionDS" runat="server" ConnectionString="<%$ ConnectionStrings:bibliotecaConnectionString %>" SelectCommand="SELECT TOP 1


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
ON d.id_usuario=u.id_usuario

ORDER BY d.fechaDevolucion DESC


"></asp:SqlDataSource>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="JSContent" runat="server">
</asp:Content>

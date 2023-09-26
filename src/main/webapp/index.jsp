


<%@page import="com.umariana.expocanina.persistencia"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.umariana.expocanina.Perro"%>
<!-- include para incluir un archivo dentro de otro, en este caso el header.  -->
<%@include file="templates/header.jsp"%>
<!-- agregar banner para interfaz principal -->
<!-- Image and text -->
<nav class="navbar navbar-light bg-light">
  <a class="navbar-brand" href="#">
    <img src="images/Expocan.jpg" width="1150" height="180" class="d-inline-block align-top" alt="">    
  </a>
</nav>
        <div class="container p-4"> <!-- clase contenedora -->
            <div class="row">
            <div class="col-md-4">  <!-- clase division por 4 columnas -->
                <div class="card card-body"> 
                    <!-- tarjeta de trabajo -->
                    <form action ="SvPerros" method = "POST" onsubmit="agregarPerro(event)" enctype="multipart/form-data">
                      <h3>Agregar nuevo perrito</h3>

                      <!-- Input para el nombre-->
                    <div class="input-group mb-3">
                      <label class="input-group-text" id="basic-addon1">Nombre</label>
                      <input type="text" name="nombre" placeholder="EL NOMBRE" aria-label="EL NOMBRE" class="form-control"   aria-describedby="basic-addplaceholder="EL NOMBRE"on1" required id="nombre" >                     
                    </div>                                            
                      <!-- Input para la raza-->
                      <div class="input-group mb-3">
                      <label class="input-group-text" id="basic-addon1">Raza</label>
                      <input type="text" name="raza" placeholder="LA RAZA" aria-label="LA RAZA" class="form-control" aria-describedby="basic-addon1" id="raza" required>
                    </div>
                      <!-- Input para la foto-->                     
                      <div class="input-group mb-3">
                         <label class="input-group-text" id="basic-addon1">Foto</label>
                         <input type="file" id="foto" name="foto" accept="image/*" class="form-control" class="form-control-file" id="foto" required>
                      </div>
                      <!-- Input para los puntos-->                   
                          <div class="input-group mb-3">
                      <label class="input-group-text" id="basic-addon1">Puntos</label>
                        <select  name="puntos" class="form-select" aria-label="Default select example" id="puntos" required="sjbjsd">
                          <option selected>Selecione...</option>
                          <option value="1">1</option>
                          <option value="2">2</option>
                          <option value="3">3</option>
                          <option value="4">4</option>
                          <option value="5">5</option>
                          <option value="6">6</option>
                          <option value="7">7</option>
                          <option value="8">8</option>
                          <option value="9">9</option>
                          <option value="10">10</option>                          
                        </select>                  
                       </div>
                      <!-- Input para la edad-->
                      <div class="input-group mb-4">
                      <label class="input-group-text" id="basic-addon1">Edad</label>
                      <input type="text" name="edad" class="form-control" placeholder="Ingrese la edad" aria-label="la edad" aria-describedby="basic-addon1" id="edad" required>
                    </div>
                       <!-- boton de agregar el perrito --> 
                            <div class="text-center">
                        <button type="submit" class="btn btn-success mx-auto">Agregar perrito</button>
                    </div>
                  </form>               
                </div>    
            </div> 
                <!-- Tabla de datos -->
            <div class="col-md-8">
                <table id="tablaPerros" class="table table-bordered">
                        
                    

                    <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Raza</th>
                        <th>Foto</th>
                        <th>Puntos</th>
                        <th>Edad</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        //Crear una lista para almacenar objetos Perro
                        ArrayList<Perro> misPerros = new ArrayList<>();
                        
                        //Obtener el contexto del servlet
                        ServletContext context = getServletContext();
                        
                        //Cargar la lista de perros desde un archivo
                        persistencia.lectura(misPerros, context);

                        //Condicional que verifica si la lista de perros no es nula
                        if (misPerros != null) {
                            for (Perro perro : misPerros) {
                    %>                   
                    <tr>
                        <td><%= perro.getNombre()%></td>
                        <td><%= perro.getRaza()%></td>
                        <td><img src="<%= request.getContextPath()%>/imgPerros/<%= perro.getFoto()%>" style="width: 200px;" alt="Imagen de perro"></td>
                        <td><%= perro.getPuntos()%></td>
                        <td><%= perro.getEdad()%></td>
                        <td><a href="#" title="Detalle"><i class="fas fa-eye"></i></a></td>  
                           <td>     <a href="#" title="Eliminar"><i class="fas fa-trash"></i></a></td>               
                    </tr>
                    <% }
                            }%>
                </tbody>
            </table>
        </div>
    </div>
</div>

<%@include file= "templates/header.jsp"%> 
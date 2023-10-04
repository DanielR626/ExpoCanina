<%@page import="com.mycompany.expoc.Serializacion"%>
<%@page import="com.mycompany.expoc.Perro"%>
<%@page import="java.util.ArrayList"%>

<%@include file= "templates/header.jsp" %>

<div class="container text-left">
    <img src="./img/front.png" alt="">
    <div class="row">
        <div class="col-lg-4 col-md-4">
            <div class="card card-body"> <!-- Tarjeta de trabajo -->
                <form action ="SvExpCanina" method = "POST" enctype="multipart/form-data">
                    <h3>Insertar nuevo perro</h3><br>
                    <div class="col-auto">
                        <label class="visually-hidden" for="nombre">Nombre</label>
                        <div class="input-group">
                            <div class="input-group-text">Nombre:</div>
                            <input type="text" class="form-control" id="nombre" name="nombre" required
                        </div>
                    </div>

                    <br><div class="col-auto">
                        <label class="visually-hidden" for="raza">Raza</label>
                        <div class="input-group">
                            <div class="input-group-text">Raza:</div>
                            <input type="text" class="form-control" id="raza" name="raza" required
                        </div>
                    </div>

                    <br><div class="col-auto">
                        <label class="visually-hidden" for="imagen">Imagen</label>
                        <div class="input-group">
                            <div class="input-group-text">Imagen:</div>
                            <input type="file" class="form-control" id="imagen" name="imagen" accept=".jpg, .jpeg, .png" required 
                        </div>
                    </div>

                    <br><div class="col-auto">
                        <label class="visually-hidden" for="puntos">Puntos</label>
                        <div class="input-group">
                            <div class="input-group-text">Puntos</div>
                            <select class="form-select" name="puntos" aria-label="Default select example" required>
                                <option value="" disabled selected>Seleccione una opción</option>
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
                    </div>

                    <br><div class="col-auto">
                        <label class="visually-hidden" for="edad">Edad</label>
                        <div class="input-group">
                            <div class="input-group-text">Edad:</div>
                            <input type="text" class="form-control" id="edad" name="edad" required pattern="[0-9]+" title="Por favor, ingrese solo números" 
                        </div>
                    </div>
            </div>
            <br><button type="submit" class="btn btn-success">Insertar Perro</button>
            </form><br
        </div>
    </div>
</div>
</div>
</div>
</div>

<div class="col-lg-8 col-md-8">
    <div class="card card-body"> <!-- Tarjeta de trabajo -->
        <div class="row">
            <table class="table table-dark table-striped">
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
                        
                        ArrayList<Perro> misPerros = new ArrayList<>();
                        
                        
                        ServletContext context = getServletContext();
                        
                        
                        Serializacion.leeArchivo(misPerros, context);

                        
                        if (misPerros != null) {
                            for (Perro perro : misPerros) {
                    %>                   
                    <tr>
                        <td><%= perro.getNombre()%></td>
                        <td><%= perro.getRaza()%></td>
                        <td><img src="<%= request.getContextPath()%>/imgPerros/<%= perro.getImagen()%>" style="width: 200px;" alt="Imagen del perro"></td>
                        <td><%= perro.getPuntos()%></td>
                        <td><%= perro.getEdad()%></td>
                        <td><a href="#" class="btn btn-primary" data-bs-toggle="modal"data-bs-target="#detalleModal" onclick="mostrarDetallesPerro('<%= perro.getNombre()%>', '<%= perro.getRaza()%>', '<%= request.getContextPath()%>/imgPerros/<%= perro.getImagen()%>', '<%= perro.getPuntos()%>', '<%= perro.getEdad()%>')"><i class="fa fa-eye"></i></a></td>  
                        
                        <td><a href="#" class="btn btn-secondary" data-bs-toggle="modal"data-bs-target="#modalEdicion" onclick="mostrarDetallesEdicion('<%= perro.getNombre()%>', '<%= perro.getRaza()%>', '<%= request.getContextPath()%>/imgPerros/<%= perro.getImagen()%>', '<%= perro.getPuntos()%>', '<%= perro.getEdad()%>')"><i class="fas fa-pencil-alt"></i></a></td>
                        
                         <td><a href="#" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#modalEliminar" onclick="mostrarModalEliminar('<%= perro.getNombre()%>')"><i class="fas fa-trash"></i></a></td>
      
                    </tr>
                    <% }
                            }%>
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>
</div>



<%@include file= "templates/footer.jsp" %>

<!-- Detalles-->
<script>
   function mostrarDetallesPerro(nombre, raza, imagen, puntos, edad) {
      // Actualiza el contenido del modal con los detalles del perro
      document.getElementById('detalleModalLabel').innerText = 'Detalles de ' + nombre;
      document.getElementById('nombrePerro').innerText = nombre;
      document.getElementById('razaPerro').innerText = raza;
      document.getElementById('imagenPerro').src = imagen;
      document.getElementById('puntosPerro').innerText = puntos;
      document.getElementById('edadPerro').innerText = edad;

      // Muestra el modal
      $('#detalleModal').modal('show');
   }
</script>

<!-- Modal de Detalles -->
<div class="modal fade" id="detalleModal" tabindex="-1" aria-labelledby="detalleModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title" id="detalleModalLabel"></h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
         </div>
         <div class="modal-body">
            <p><strong>Nombre:</strong> <span id="nombrePerro"></span></p>
            <p><strong>Raza:</strong> <span id="razaPerro"></span></p>
            <img src="" id="imagenPerro" style="width: 200px;" alt="Imagen del perro">
            <p><strong>Puntos:</strong> <span id="puntosPerro"></span></p>
            <p><strong>Edad:</strong> <span id="edadPerro"></span></p>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
         </div>
      </div>
   </div>
</div>



<!-- Editar-->
<script>
   function mostrarDetallesEdicion(nombre, raza, imagen, puntos, edad) {
      // Actualiza el título del modal de edición con el nombre del perro
      document.getElementById('modalEdicionLabel').innerText = 'Editar ' + nombre;
      document.getElementById('nombreEdicion').value = nombre;
      document.getElementById('razaEdicion').value = raza;
      document.getElementById('imagenEdicion').src = imagen;
      document.getElementById('puntosEdicion').value = puntos;
      document.getElementById('edadEdicion').value = edad;

      // Muestra el modal de edición
      $('#modalEdicion').modal('show');
   }
</script>

<!-- Modal de Edición -->
<div class="modal fade" id="modalEdicion" tabindex="-1" aria-labelledby="modalEdicionLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalEdicionLabel">Editar Perro</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="SvExpCaninaEditar" method="POST" enctype="multipart/form-data">
                    <input type="hidden" id="nombreEdicion" name="nombre">
                    <div class="mb-3">
                        <label for="razaEdicion" class="form-label">Raza</label>
                        <input type="text" class="form-control" id="razaEdicion" name="raza" required>
                    </div>
                    <div class="mb-3">
                        <label for="imagenEdicion" class="form-label">Imagen</label>
                        <input type="file" class="form-control" id="imagenEdicion" name="imagen" accept=".jpg, .jpeg, .png">
                    </div>
                    <div class="mb-3">
                        <label for="puntosEdicion" class="form-label">Puntos</label>
                        <select class="form-select" id="puntosEdicion" name="puntos" required>
                            <option value="" disabled selected>Seleccione una opción</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <!-- Otras opciones de puntos -->
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="edadEdicion" class="form-label">Edad</label>
                        <input type="text" class="form-control" id="edadEdicion" name="edad" required pattern="[0-9]+" title="Por favor, ingrese solo números">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- Eliminar-->
<script>
   var nombrePerroAEliminar;

   function mostrarModalEliminar(nombre) {
      nombrePerroAEliminar = nombre;
      $('#modalEliminar').modal('show');
   }
</script>

<script>
   function eliminarPerroPorNombre() {
      // Recorre tu lista de perros y busca el perro por su nombre (nombrePerroAEliminar)
      // Cuando encuentres el perro, elimínalo de la lista

      // Cerrar el modal de eliminación
      $('#modalEliminar').modal('hide');
   }
</script>

<!-- Modal de Eliminación -->
<div class="modal fade" id="modalEliminar" tabindex="-1" aria-labelledby="modalEliminarLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title" id="modalEliminarLabel">Confirmar Eliminación</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
         </div>
         <div class="modal-body">
            <p>¿Está seguro de que desea eliminar al perro <span id="nombrePerroAEliminar"></span>?</p>
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
            <button type="button" class="btn btn-danger" onclick="eliminarPerroPorNombre()">Eliminar</button>
         </div>
      </div>
   </div>
</div>


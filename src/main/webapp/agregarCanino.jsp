<%@page import="com.umariana.expocanina.exposicion"%>

<%@page import="java.util.List"%>
<%@page import="com.umariana.expocanina.Perro"%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<%@include file= "templates/header.jsp" %>

  <nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
      <a class="navbar-brand" href="index.jsp">Inicio</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#" onclick="playSound()">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#" onclick="playSound()">Link</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="ordenamientosDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Ordenamientos
            </a>
            <ul class="dropdown-menu" aria-labelledby="ordenamientosDropdown">
              <li><a class="dropdown-item" href="#">Ordenamiento Alfabético</a></li>
              <li><a class="dropdown-item" href="#">Ordenamiento por Raza</a></li>
              <li><a class="dropdown-item" href="#">Ordenamiento por Edad</a></li>
              <li><a class="dropdown-item" href="#">Ordenamiento por Puntos</a></li>
            </ul>
          </li>
          <li class="nav-item">
            <a class="nav-link disabled" aria-disabled="true" onclick="playSound()">Disabled</a>
          </li>
        </ul>
        <form class="d-flex" role="search">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success" type="submit" onclick="playSound()">Search</button>
        </form>
      </div>
    </div>
  </nav>

  <!-- Script para agregar sonido a los botones -->
  <script>
    function playSound() {
      var audio = new Audio('ladrido.mp3'); // Ruta al archivo de sonido de ladrido de perro
      audio.play(); // Reproducir el sonido
    }
  </script>
</body>
</html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Perros</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    </head>
    <body>
        <div class="container p-4">
            
            <img src="${pageContext.request.contextPath}/img/Expocanina.jpeg" alt="Expo Canina" class="img-fluid">
            <h1>Insertar nuevo perro</h1>
            <div class="row">
                <div class="col-md-4">
                    <div class="card card-body">
                        <form action="SvPerros" method="POST" enctype="multipart/form-data">
                            
                            <label for="nombre">Nombre:</label>
                            <input type="text" name="nombre" class="form-control"><br>
                            <label for="raza">Raza:</label>
                            <input type="text" name="raza" class="form-control"><br>
                            <label for="foto">Foto:</label>
                            <input type="file" name="foto" class="form-control"><br>
                            <label for="puntos">Puntos:</label>
                            <select name="puntos" class="form-select" required>
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
                            </select><br>
                            <label for="edad">Edad:</label>
                            <input type="text" name="edad" class="form-control"><br>
                            <input type="submit" value="Insertar Perro" class="form-control">
                        </form><br>
                        <a href="index.jsp">Regresar al menú</a>
                    </div>
                </div>
                               <!-- Tabla de datos -->
        
            <div class="col-md-8">
                <%
                   
                    ServletContext servletContext=request.getServletContext();
                    
                   
                    
                    List<Perro> misPerros = exposicion.CargarPerro(servletContext);
                    
                    System.out.println("desde el index  "+misPerros);
                    
                    if (misPerros == null) {
                        // Mostrar un mensaje de error al usuario
                        request.setAttribute("error", "La lista de perros está vacía.");
                    }
                %>
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
                            if (misPerros!=null){
                            for (Perro perro : misPerros) {
                        %>
                            <tr>
                                <td><%= perro.getNombre()%></td>
                                <td><%=perro.getRaza()%></td>
                                <td><%=perro.getFoto()%></td>
                                <td><%=perro.getPuntos()%></td>
                                <td><%=perro.getEdad()%></td>
                                <td>
                                    <div class="d-flex">
                                        <a href="#" class="btn btn-primary" data-bs-toggle="modal"data-bs-target="#detalleModal" data-nombre="</%=p.getNombre()%"><i class="fa fa-eye"></i></a>
                                        <a href="#" title="Editar"><i class="fas fa-pencil-alt"></i></a>
                                        <a href="#" title="Eliminar"><i class="fas fa-trash"></i></a>
                                    </div>
                                </td>
                            </tr>
                        <%
                            }
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
            </div>
        
     
   <%@include file= "templates/footer.jsp" %>
   
   <!-- Modal -->
            <div class="modal fade" id="detalleModal" tabindex="-1" aria-labelledby="detalleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="detalleModalLabel">Detalles del Perro</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <div id="perro-details">
                             
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                            
                        </div>
                    </div>
                </div>
            </div>


<%@page import="com.umariana.exposicionCanina.Perro"%>
<%@page import="com.umariana.exposicionCanina.Persistencia"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>

<head>

</head>

<body style="background-color: #ADD8E6; color: white; font-style: italic;">

    <%@include file="templates/header.jsp"%>

    <nav class="navbar navbar-light bg-light">
        <a class="img-fluid mx-auto navbar-brand">
            <img src="imagenes/banner.jpg" style="width: 100%; height: auto;" class="d-inline-block align-top" alt="banner">
        </a>
    </nav>
    
   

    <div style="font-family: 'Archivo Black';" class="container-fluid">

        <div class="row max-width">
           

            <div class="col-md-4 mx-auto">
                <div class="card card-body">

                    <form action="svCaninos" method="POST" enctype="multipart/form-data">
                        <div class="mb-3 text-center">
    <label for="nombre" class="form-label" style="color: black;"><b>Nombre del Perro</b></label>
    <input type="text" name="nombre" class="form-control" id="nombre" placeholder="Ingrese el nombre" required>
</div>

<div class="mb-3 text-center">
    <label for="raza" class="form-label" style="color: black; display: block; text-align: center;"><b>Raza del Perro</b></label>
    <input type="text" name="raza" class="form-control" id="raza" placeholder="Ingrese la raza" required>
</div>


<div class="mb-3 text-center">
    <label for="foto" class="form-label" style="color: black;"><b>Foto del Perro</b></label>
    <input type="file" class="form-control" name="foto" id="foto" accept="image/jpeg, image/pjpeg, image/png, image/gif, image/svg+xml, image/bmp, image/tiff" required>
</div>

<div class="mb-3 text-center">
    <label for="puntos" class="form-label" style="color: black;"><b>Puntos del Perro</b></label>
    <select class="form-select" name="puntos" required>
        <option value="" disabled selected>Seleccione...</option>
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

<div class="mb-3 text-center">
    <label for="edad" class="form-label" style="color: black;"><b>Edad del Perro</b></label>
    <input type="text" name="edad" class="form-control" id="edad" placeholder="Ingrese la edad" required>
</div>
                        <div class="text-center">
    <button type="submit" class="btn btn-success">Agregar Perro</button>
</div>

                    </form>
                </div>
            </div>
            
            <div class="col-md-8">
                <table style="font-family: 'Archivo Black';" class="table  table-bordered table-light">
                    <script src="https://cdn.jsdelivr.net/npm/@popperjs/[email protected]/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.0.0-beta1/js/bootstrap.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq0v8FqFjcJ6pajs/rfdfs3SO+kD4Ck5BdPtF+to8xM6B5z6W5" crossorigin="anonymous"></script>
                    
                    <div class="navbar-nav">
                        <div class="input-group">
                            <input type="text" class="form-control" id="nombrePerroABuscar" placeholder="Buscar nombre del perrito">
                            <button class="btn btn-primary" id="btnBuscar" type="button" data-bs-toggle="modal" data-bs-target="#modalBusqueda">Buscar Perro</button>
                        </div>
                    </div>
                    <thead>
                        <tr class="text-center">
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
        
        Persistencia.lectura(misPerros, context);
        
        if (misPerros != null) {

            for (Perro perro : misPerros) {
    %>
    <tr id="tr" class="text-center">

        <td><i><%= perro.getNombre() %></i></td>
        <td><i><%= perro.getRaza() %></i></td>
        <td><i><%=perro.getFoto()  %></i></td>
        <td><i><%= perro.getPuntos() %></i></td>
        <td><i><%= perro.getEdad() %></i></td>
        <td>
            <a href="svCaninos" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal" data-nombre="<%=perro.getNombre()%>">
                <i class="fas fa-eye text-white"></i>
            </a>
            <a href="#editModal" class="btn btn-warning btn-sm" title="Editar" onclick="abrirFormularioEdicion('<%= perro.getNombre() %>', '<%= perro.getRaza() %>', '<%= perro.getPuntos() %>', '<%= perro.getEdad() %>')">
                <i class="fas fa-edit text-white"></i>
            </a>
            <button class="btn btn-danger btn-sm" onclick="eliminarPerro('<%= perro.getNombre() %>')">
                <i class="fas fa-trash-alt text-white"></i>
            </button>
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

    <%@include file="templates/footer.jsp"%>
</body>

</html>
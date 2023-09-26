<%-- 
    Document   : index
    Created on : 20/09/2023, 5:15:40 p. m.
    Author     : DANIEL REVELO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <body>     
        <div class="container p-4"> <!-- clase contenedora -->
            <h1>Sistema Reproductor de videos</h1>
            <div class="row">
            <div class="col-md-4">  <!-- clase division por 4 columnas -->
                <div class="card card-body"> <!-- tarjeta de trabajo -->
                  <form action="SvVideo" method="POST">
                    <label for="idvideo">idVideo:</label>
                    <input type="text" name="idvideo" class="form-control"><br>
                    <label for="titulo">Titulo:</label>
                    <input type="text" name="titulo" class="form-control"><br>       
                    <label for="autor">Autor:</label>
                    <input type="text" name="autor" class="form-control"><br>      
                    <label for="anio">Año:</label>
                    <input type="text" name="anio" class="form-control"><br>         
                    <label for="categoria">Categoria:</label>
                    <input type="text" name="categoria" class="form-control"><br>        
                    <label for="url">Url:</label>
                    <label for="letra">Letra:</label>
                    <textarea name="letra" rows="5" class="form-control"></textarea><br>         
                    <input type="submit" value="Agregar Video" class="form-control">
                </form><br>
        <a href="index.jsp">Regresar al menu</a> 
                </div>    
            </div>  
            <div class="col-md-8">
                    <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>Titulo</th>
                            <th>Autor</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>No dejes que</td>
                            <td>Caifanes</td>
                            <td>Editar Borrar</td>
                        </tr>
                    </tbody> 
                </table>
                </div>
               </div>  
            </div>    
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>

    </body>
</html>

<!-- La importaci�n de Bootstrap se realiza para aplicar estilos. -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>       
<!-- Aqu� comienza la creaci�n de los scripts. -->
<!-- Este script est� destinado a la funci�n de mostrar los detalles del perro.-->
<script>
    // La funci�n se encarga de mostrar los datos en la ventana modal.
    $('#exampleModal').on('show.bs.modal', function (event) {
        // El bot�n que activ� el evento.
        var button = $(event.relatedTarget); 
        // Recupera el nombre del perro.
        var nombre = button.data('nombre'); 
        // Ejecuta una solicitud AJAX al servlet para obtener los detalles del perro seg�n su nombre.
        $.ajax({
            // Sustituye 'id' por el nombre del par�metro que esperas en tu servlet.
            url: 'svCaninos?nombre=' + nombre, 
            method: 'GET',
            success: function (data) {
        // Actualiza el contenido del modal con la informaci�n detallada del perro.                   
        $('#perro-details').html(data);            
    },
            error: function () {
        // Gestiona errores aqu� si es necesario.
        console.log('Error al cargar los detalles del perro.');
    }
        });
    });
</script>   
<!-- El siguiente script muestra en una ventana modal al perro m�s viejo de una lista.-->
<script>
    $(document).ready(function() {       
        // El siguiente bot�n muestra al perro m�s viejo de una lista. Al hacer clic en �l, se abrir� una ventana modal con la informaci�n del perro m�s viejo.   
        $('#btnMostrarPerroMasViejo').click(function() {       
        // Estamos iniciando variables para llevar un registro del perro m�s viejo.       
        var edadMasViejo = -Infinity;      
        var filaMasViejo = null;           
        // Recorremos las filas para identificar al perro m�s viejo.         
        $('tr').each(function() {            
        var edad = parseInt($(this).find('td:nth-child(5)').text()); // Suponiendo que la columna de edad es la quinta (�ndice 4)            
        if (!isNaN(edad) && edad > edadMasViejo) {           
            edadMasViejo = edad;           
            filaMasViejo = $(this);          
        }          
    });                 
        if (filaMasViejo !== null) {                
        // Obtenemos todos los datos del perro m�s antiguo                       
        var nombrePerroMasViejo = filaMasViejo.find('td:nth-child(1)').text(); // Nombre               
        var razaPerroMasViejo = filaMasViejo.find('td:nth-child(2)').text(); // Raza                
        var edadPerroMasViejo = filaMasViejo.find('td:nth-child(5)').text(); // Edad               
        var puntosPerroMasViejo = filaMasViejo.find('td:nth-child(4)').text(); // Puntos                
        var fotoPerroMasViejo = filaMasViejo.find('td:nth-child(3)').text(); // Foto (ubicaci�n)            
        // Actualizamos los elementos en la ventana modal con la informaci�n del perro.            
        $('#nombreMayorPuntaje').text(nombrePerroMasViejo);              
        $('#razaMayorPuntaje').text(razaPerroMasViejo);              
        $('#edadMayorPuntaje').text(edadPerroMasViejo);               
        $('#puntosMayorPuntaje').text(puntosPerroMasViejo);               
        $('#imagenMayorPuntaje').attr('src', 'foto/' + fotoPerroMasViejo); // Modifica aqu� la ruta de acuerdo a la estructura de tus directorios.             
        $('#modalMayorPuntaje').modal('show');              
    }   else    {                           
        alert('No hay perros en la lista.');         
    }    
});
});
</script>                        
<!-- Este script se utiliza para resaltar al perro perdedor o con la puntuaci�n m�s baja.-->
<script>
    $(document).ready(function() {        
        // Bot�n para mostrar el perro con la puntuaci�n m�s baja.     
        $('#btnMostrarMenorPuntaje').click(function() {        
        // Estamos inicializando variables para hacer un seguimiento del perro con la puntuaci�n m�s baja.         
        var menorPuntaje = Infinity;      
        var filaMenorPuntaje = null;
        // Recorremos las filas para localizar al perro con la puntuaci�n m�s baja         
        $('tr').each(function() {               
        var puntaje = parseInt($(this).find('td:nth-child(4)').text()); 
        if (!isNaN(puntaje) && puntaje < menorPuntaje) {   
            menorPuntaje = puntaje;               
            filaMenorPuntaje = $(this);             
        }            
    });           
        if (filaMenorPuntaje !== null) {           
        // Obtenemos todos los datos del perro con la puntuaci�n m�s baja.            
        var nombrePerroMenorPuntaje = filaMenorPuntaje.find('td:nth-child(1)').text(); // Nombre              
        var razaPerroMenorPuntaje = filaMenorPuntaje.find('td:nth-child(2)').text(); // Raza              
        var edadPerroMenorPuntaje = filaMenorPuntaje.find('td:nth-child(5)').text(); // Edad                
        var puntosPerroMenorPuntaje = filaMenorPuntaje.find('td:nth-child(4)').text(); // Puntos           
        var fotoPerroMenorPuntaje = filaMenorPuntaje.find('td:nth-child(3)').text(); // Foto (ubicaci�n)            
        // Actualizamos los elementos en la ventana modal con la informaci�n del perro.               
        $('#nombreMayorPuntaje').text(nombrePerroMenorPuntaje);               
        $('#razaMayorPuntaje').text(razaPerroMenorPuntaje);
    
        $('#edadMayorPuntaje').text(edadPerroMenorPuntaje);                
        $('#puntosMayorPuntaje').text(puntosPerroMenorPuntaje);                
        $('#imagenMayorPuntaje').attr('src', 'foto/' + fotoPerroMenorPuntaje);                         
        $('#modalMayorPuntaje').modal('show');           
    } else {                       
        alert('No hay perros en la lista.');         
    }
});   
});
</script>

<!-- Este script se utiliza para resaltar al perro con la puntuaci�n m�s alta, destac�ndolo como el ganador.-->
                                                                                    
<script>
    $(document).ready(function() {
        $('#btnMostrarMayorPuntaje').click(function() {           
        // Estamos inicializando variables para llevar un registro del perro con la puntuaci�n m�s alta.          
        var mayorPuntaje = -1;          
        var filaMayorPuntaje = null;           
        // Recorremos las filas para identificar al perro con la puntuaci�n m�s alta.            
        $('tr').each(function() {             
        var puntaje = parseInt($(this).find('td:nth-child(4)').text());             
        if (!isNaN(puntaje) && puntaje > mayorPuntaje) {            
            mayorPuntaje = puntaje;                      
            filaMayorPuntaje = $(this);           
        }            
    });            
        if (filaMayorPuntaje !== null) {               
        // Obtenemos todos los datos del perro con la puntuaci�n m�s alta.           
        var nombrePerroMayorPuntaje = filaMayorPuntaje.find('td:nth-child(1)').text(); // Nombre           
        var razaPerroMayorPuntaje = filaMayorPuntaje.find('td:nth-child(2)').text(); // Raza                      
        var edadPerroMayorPuntaje = filaMayorPuntaje.find('td:nth-child(5)').text(); // Edad              
        var puntosPerroMayorPuntaje = filaMayorPuntaje.find('td:nth-child(4)').text(); // Puntos                
        var fotoPerroMayorPuntaje = filaMayorPuntaje.find('td:nth-child(3)').text(); // Foto (ubicaci�n)              
        // Actualizamos los elementos en la ventana modal con la informaci�n del perro.               
        $('#nombreMayorPuntaje').text(nombrePerroMayorPuntaje);               
        $('#razaMayorPuntaje').text(razaPerroMayorPuntaje);                
        $('#edadMayorPuntaje').text(edadPerroMayorPuntaje);              
        $('#puntosMayorPuntaje').text(puntosPerroMayorPuntaje);      
        $('#imagenMayorPuntaje').attr('src', 'foto/' + fotoPerroMayorPuntaje);           
        $('#modalMayorPuntaje').modal('show');           
    } else {           
        alert('No hay perros en la lista.');            
    }
});
});
</script>
<!-- Este script permite eliminar la informaci�n de un perro.-->             
<script>
    function eliminarPerro(nombrePerro) {
                       
        if (confirm("          �Est�s seguro de que quieres eliminar a " + nombrePerro + "?" + "\n" +                        
                "\n" +                         
                "                          Esta acci�n no se puede cancelar.")) {                                 
            // Env�a una solicitud AJAX al servidor para eliminar al perro.                              
            $.ajax({                                
                type: 'GET',                                                
                url: 'svCaninos?eliminar=' + nombrePerro,                                        
                success: function (data) {                                                                                           
        // Actualiza la tabla en la p�gina sin necesidad de recargarla.                                       
        location.reload();                                    
    },                                   
                error: function () {                                   
        console.log('Error al eliminar el perro.');                                 
    }                             
            });                             
        }
    }
</script> 





<!-- Este script se utiliza para notificar con una ventana modal emergente la existencia de un nombre duplicado de un perro y prevenir errores.-->
<script>
    // Se comprueba si es necesario mostrar el modal de nombre duplicado cuando se ingresa un perro con el mismo nombre.
    <% if (request.getAttribute("nombreDuplicado") != null) { %>                            
    $(document).ready(function() {                           
        $('#nombreDuplicadoModal').modal('show');                           
    });                          
    <% } %>
</script>
<!--Este script se utiliza para buscar a un perro por su nombre.-->
<script>
    $(document).ready(function() {
  
        $('#btnBuscar').click(function() {
        var nombreABuscar = $('#nombrePerroABuscar').val().trim();
        var modalTitle = $('#modalBusqueda').find('.modal-title'); 
        if (nombreABuscar === '') {          
            // Mostrar la ventana modal con un t�tulo de error si el campo de b�squeda est� vac�o          
            modalTitle.text('Error');
            $('#alertaBusquedaVacia').show();
            // Borrar el contenido de la ventana modal para eliminar la informaci�n del perro previamente buscado.
            $('#perro-detailss').html('');
            return; 
        } else {
            // Esconder el mensaje de alerta si se proporcion� un nombre v�lido.
            $('#alertaBusquedaVacia').hide();
        }        
        // Restablecer el t�tulo por defecto de la ventana modal.
        modalTitle.text('�Este es el perrito que buscabas?');               
        // Hacer una solicitud AJAX al servidor para buscar al perro por nombre.       
        $.ajax({          
            type: 'GET',
            //Se utiliz� 'nombre' para simplificar y recorrerlo, no hay razones para imponer sanciones por esto.        
            url: 'svCaninos?nombre=' + nombreABuscar,            
            success: function(data) {                
        // Comprobar si se encontraron resultados antes de mostrar la ventana modal.               
        if (data.trim() !== '') {         
            // Actualizar la tabla de resultados con los detalles del perro.                  
            $('#perro-detailss').html(data);               
        } else {                
            // Mostrar un mensaje si no se encontraron resultados  
            alert('No se encontraron resultados para el nombre de perro ingresado.');                
            // Borrar el contenido de la ventana modal para eliminar la informaci�n del perro previamente buscado              
            $('#perro-detailss').html('');             
        }     
    },            
            error: function() {              
        // Manejar errores aqu� si es necesario             
        console.log('Error al buscar el perro.');           
    }         
        });
    });
});               
</script>

<!-- Este script se utiliza para editar la informaci�n del perro seleccionado-->
<script>
   
    function abrirFormularioEdicion(nombrePerro, razaPerro, puntosPerro, edadPerro, fotoPerro) {
    
        // Llena el formulario de edici�n con los datos actuales del perro.   
        document.getElementById("editDogNombre").value = nombrePerro;    
        document.getElementById("nuevoNombre").value = nombrePerro;
    
        document.getElementById("editDogRaza").value = razaPerro;    
        document.getElementById("nuevaRaza").value = razaPerro;
    
        // Para la imagen, estableciendo la foto actual del perrito.   
        var imgElement = document.getElementById("fotoActual");    
        imgElement.src = "<%= request.getContextPath() %>/foto/" + fotoPerro;         
        
        document.getElementById("editDogPuntos").value = puntosPerro;
        document.getElementById("nuevosPuntos").value = puntosPerro;
       
        document.getElementById("editDogEdad").value = edadPerro;
        document.getElementById("nuevaEdad").value = edadPerro;    
    $('#editModal').modal('show');
}
</script>
</body>
</html>
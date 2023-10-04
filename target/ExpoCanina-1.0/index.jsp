<%@ include file="templates/header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <style>
    /* Estilos personalizados para la barra de navegación */
    .navbar {
      background-color: #3498db; /* Cambiar el color de fondo */
    }

    .navbar-brand {
      color: #fff; /* Cambiar el color del texto del logotipo */
      font-size: 24px; /* Cambiar el tamaño del texto del logotipo */
    }

    .nav-link {
      color: #fff; /* Cambiar el color de los enlaces de navegación */
    }
  </style>
</head>
<body>
  <nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
      <a class="navbar-brand" >Exposición Canina </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="agregarCanino.jsp" onclick="playSound()">Agregar Perros</a>
          </li>
          
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


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bienvenido a Exposición Canina</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Pacifico&display=swap">

    <style>
        body {
            background-image: url('https://img.freepik.com/fotos-premium/perro-gafas-sol-sentado-motocicleta-perro-chaqueta-gafas-sol-sentado-motocicleta-dog-biker_401949-1733.jpg');
            background-size: 100%;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
        }

        .header {
            text-align: center;
            background-color: rgba(0, 0, 0, 0.5); /* Agregar un fondo semi-transparente */
            padding: 20px;
            font-size: 60px; /* Aumentar el tamaño de la fuente */
            color: #FF5733; /* Cambiar el color del texto a naranja */
            font-family: 'Pacifico', cursive;
            border-radius: 10px; /* Añadir bordes redondeados */
            margin: 20px;
            animation: moveTitle 1s infinite alternate; /* Agregar animación de desplazamiento */
        }

        @keyframes moveTitle {
            0% {
                transform: translateX(0);
            }
            100% {
                transform: translateX(20px);
            }
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            text-align: center;
            background-color: rgba(255, 255, 255, 0.9); /* Agregar un fondo blanco semi-transparente */
            border-radius: 10px;
        }

        .btn-primary {
            background-color: #1DB954;
            border-color: #1DB954;
            color: #fff;
            padding: 10px 20px;
            font-size: 18px;
            text-decoration: none;
        }

        .btn-primary:hover {
            background-color: #179743;
            border-color: #179743;
        }

        /* Estilos para el carrusel */
        #carouselExampleSlidesOnly {
            margin-bottom: 20px;
        }

        .carousel-inner img {
            max-width: 100%;
            height: auto;
        }

        /* Estilos para la descripción */
        .description {
            text-align: center;
            font-family: Arial, sans-serif;
            font-size: 16px;
            margin-top: 20px;
        }
        
        .options {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="header">
        Bienvenido a Exposición Canina
    </div>
        
    </div>

    <script src="https://cdn.jsdelivr.net/npm bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <p class="description" style="position: absolute; bottom: 0; background-color: rgba(255, 255, 255, 0.9); padding: 10px; text-align: center; width: 100%;">"Adéntrate en el emocionante mundo de la Exposición Canina, un escaparate de elegancia y belleza canina. Descubre las razas más destacadas y celebra la unión entre humanos y perros. ¡Acompáñanos y déjate deslumbrar por estos encantadores compañeros de cuatro patas!"</p>
</body>
</html>


<%@ include file="templates/footer.jsp" %>

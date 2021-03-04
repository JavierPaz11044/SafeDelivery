<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="css/app.css">
    <link rel="stylesheet" href="css/resposiveAdapter.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.7.6/min/dropzone.min.css" integrity="sha512-WvVX1YO12zmsvTpUQV8s7ZU98DnkaAokcciMZJfnNWyNzm7//QRV61t4aEr0WdIa4pe854QHLTV302vH92FSMw==" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css" integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous"> <link rel="shortcut icon" href="assets/g4708.png">   <title>Safe Delivery</title>
    <!--meta name="csrf-token" content="{{ csrf_token() }}"-->
</head>
<body>

<div class="container__aux">
    <div class="image">
        <img src="assets/bg.jpeg" class="d-block w-100 tamanio" alt="...">
    </div>
    <div class="over-image">
    </div>

    <div class=" container-section" id="id-change">
        <div class="container-nav">
            <nav class="navbar navbar-expand-lg navbar-light container ">

                <a class="navbar-brand" href="#" style="display: flex; font-size: 1em">
                    <img src="assets/g4708.png" style="width: 3em">
                    <div class="log-info" style="text-align: center">
                        <h3>
                            SAFE DELIVERY
                        </h3>
                        <h6>
                            Repartiendo sonrisas
                        </h6>
                    </div>
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-sm-end" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Inicio <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" data-toggle="modal"
                               data-target="#exampleModalCenter">Oferta Laboral</a>
                        </li>
                        <li class="nav-item" style="display: flex; align-items: center">
                            <a data-toggle="modal" data-target="#exampleModalLong"> Encuetranos</a>
                            <a data-toggle="modal" data-target="#exampleModalLong"><img
                                    src="assets/posicion.svg"
                                    style="width: 2em; top: 0">
                            </a>
                        </li>

                    </ul>
                </div>
            </nav>
        </div>

        <div class="container-information recuadro ocultar">
            <div class="container-presentacion">
                <div class="container-message">
                    <p>
                        Unidad estratégica de Negocios se orienta a la busqueda de soluciones para el manejo de
                        mercancías
                        desde el lugar que se inicia el proceso hasta el cliente final. Se presta el servicio de
                        recolección, transporte, distribución y entrega puerta a puerta, cubriendo trayectos urbanos,
                        regionales, nacionales e internacionales.
                    </p>
                </div>
                <div class="container-integrations" data-toggle="modal" data-target="#exampleModalCenter">
                    <button class="btn btn-colors">
                        Oferta Laboral
                    </button>
                </div>
            </div>
            <div class="container-carousel">
                <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="assets/imagen1.jpeg" class="d-block tamanio" alt="...">

                        </div>
                        <div class="carousel-item">
                            <img src="assets/imagen2.jpeg" class="d-block tamanio" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="assets/imagen3.jpeg" class="d-block tamanio" alt="...">
                        </div>

                        <div class="carousel-item">
                            <img src="assets/imagen4.jpeg" class="d-block tamanio" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="assets/imagen5.jpeg" class="d-block tamanio" alt="...">
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>


    <!-- Modal -->
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="title-center">
                        <h5 class="modal-title" id="exampleModalLongTitle">Ingresa tus datos</h5>
                    </div>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="input-data" action="/SendMessageServlet" method="POST" enctype="multipart/form-data">
                        <!--{{ csrf_field() }}
                        {{method_field('POST')}}-->
                        <div class="container-form">
                            <div class="container-name">
                                <div class="container_name">
                                    <input id="nombre" type="text" name="nombre" required="required"
                                           placeholder="Nombre">
                                    <div class="message-validations">
                                        Por favor ingresa tus nombres.
                                    </div>
                                </div>
                                <div class="container_apellido">
                                    <input id="apellido" type="text" name="apellido" required="required"
                                           placeholder="Apellido">
                                    <div class="message-validations">
                                        Por favor ingresa tus apellidos.
                                    </div>
                                </div>
                            </div>
                            <div class="container-email">
                                <div class="email">

                                    <input class="form-control email" id="email" type="email" name="email"
                                           required="required"
                                           placeholder="Email">
                                    <div class="message-validations">
                                        Por favor ingresa un email.
                                    </div>

                                </div>

                            </div>
                        </div>
                        <div
                                class="dropzone"
                                id="dropzoneFileUpload"> </div>
                    </form>
                </div>

                <div class="modal-footer justify-content-center">
                    <button type="submit" id="submit-all" class="btn btn-primary"> Enviar</button>
                    <button type="reset" class="btn btn-primary" onclick="reset()" data-dismiss="modal">Cancelar
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <iframe
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3208.372284324187!2d-6.1748600847192945!3d36.47272338001724!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMzbCsDI4JzIxLjgiTiA2wrAxMCcyMS42Ilc!5e0!3m2!1ses!2sec!4v1614526382525!5m2!1ses!2sec"
                            width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <i class="fas fa-check-circle"></i> El mensaje se ha enviado correctamente
                </div>

            </div>
        </div>
    </div>

    <div class=" bg-color" id="mostrar">
        <div class="bg">
            <div class="spinner-border" id="start" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
    </div>


    <!--
    integracion de redes sociales
    -->
    <a class="appWpp" target="_blank" href="https://api.whatsapp.com/send?phone=593967512206&text=Hola!&nbsp;,necesito&nbsp;ayuda!&nbsp;">
        <img src="assets/whatsapp.svg" alt="whatsapp">
    </a>
    <!-- Load Facebook SDK for JavaScript -->
    <div id="fb-root"></div>
    <script>
        window.fbAsyncInit = function() {
            FB.init({
                xfbml            : true,
                version          : 'v10.0'
            });
        };

        (function(d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = 'https://connect.facebook.net/en_US/sdk/xfbml.customerchat.js';
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));</script>

    <!-- Your Chat Plugin code -->
    <div class="fb-customerchat"
         attibution="setup_tool"
         page_id="103854108430372"
         theme_color="#ffc300">
    </div>

</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="js/SendDataEmail.js"></script>
<script src="js/transitions.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.7.6/min/dropzone.min.js"
        integrity="sha512-KgeSi6qqjyihUcmxFn9Cwf8dehAB8FFZyl+2ijFEPyWu4ZM8ZOQ80c2so59rIdkkgsVsuTnlffjfgkiwDThewQ=="
        crossorigin="anonymous"></script>
<script>
    //var baseUrl = "{{ url('/') }}";
    var buttonSubmit = document.getElementById('submit-all')
    Dropzone.options.myAwesomeDropzone = false;
    Dropzone.autoDiscover = false;
    var myDropzone = new Dropzone("div#dropzoneFileUpload", {
        url: 'SafeDelibery_war_exploded/SendMessageServlet',
        method: 'POST',
        enctype: 'multipart/form-data',
        paramName: "archivo",
        dictDefaultMessage: '<div class="container"> <i class="fas fa-file-upload"></i> ' +
            '<div > <button class="container-btn-upload"  type="button" onclick="null"> Subir curriculum</button> </div> </div>',
        addRemoveLinks: true,
        dictRemoveFile: "Eliminar",
        uploadMultiple: false,
        parallelUploads: 1,
        maxFiles: 1,
        acceptedFiles: "application/pdf",
        autoProcessQueue: false
    });

</script>


</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="css/app.css">
    <link rel="stylesheet" href="css/resposiveAdapter.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.7.6/min/dropzone.min.css"
          integrity="sha512-WvVX1YO12zmsvTpUQV8s7ZU98DnkaAokcciMZJfnNWyNzm7//QRV61t4aEr0WdIa4pe854QHLTV302vH92FSMw=="
          crossorigin="anonymous"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css"
          integrity="sha384-vSIIfh2YWi9wW0r9iZe7RJPrKwp6bG+s9QZMoITbCckVJqGCCRhc+ccxNcdpHuYu" crossorigin="anonymous">
    <link rel="shortcut icon" href="assets/g4708.png">
    <title>Safe Delivery</title>
    <!--meta name="csrf-token" content="{{ csrf_token() }}"-->
</head>
<body>

<div class="container__aux">
    <div class="container menuAndLogo" id="id-change">
        <div class="container-logo">
            <div class="Logo">
                <div class="imgLogo">
                    <img id="animLogo" src="assets/imagenPo.svg">
                </div>
                <div class="msmLogo" id="msmLogo">
                    <h1>
                        SAFE DELIVERY
                    </h1>
                    <h3>
                        COMPARTIENDO SONRISAS
                    </h3>
                </div>
            </div>
        </div>
        <div class="container-menu">
            <div class="menu">
                <div class="inicio">
                    <button class="btn anima" id="btnInicio" onclick="reload()">
                        Inicio
                    </button>
                </div>
                <div id="quienesSomos" data-target="#exampleModalinformations" data-toggle="modal">
                    <button class="btn anima" id="btnSomos">
                        ¿Quiénes somos?
                    </button>
                </div>
                <div id="trabajaNosotros">

                    <button class="btn anima" id="btnNosotros" data-target="#exampleModalCenter" data-toggle="modal">
                        Trabaja con nosotros
                    </button>
                </div>
                <div id="dondeEstamos" data-target="#exampleModalLong" data-toggle="modal">
                    <button class="btn anima" id="btnEstamos">
                        ¿Dónde estamos?
                    </button>
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
                            <div class="container-input-name">
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
                                id="dropzoneFileUpload"></div>
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
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content" style="width: auto !important;">
                <div class="modal-header " style="width: 100% !important;">
                    <div class="title-center">
                        <h5 class="modal-title" id="tittlePosition" style="font-size: 2em">¿Dónde estamos?</h5>
                    </div>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" style="width: auto !important;">
                    <div class="container-map">

                        <iframe
                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3208.372284324187!2d-6.1748600847192945!3d36.47272338001724!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMzbCsDI4JzIxLjgiTiA2wrAxMCcyMS42Ilc!5e0!3m2!1ses!2sec!4v1614526382525!5m2!1ses!2sec"
                                width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                    </div>
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

    <!-- modal informations-->
    <div class="modal fade" id="exampleModalinformations" tabindex="-1" role="dialog"
         aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content  modal-bg">
                <div class="modal-header">
                    <div class="title-center title-info">
                        <h5 class="modal-title" id="exampleModalLongTitleInformations"> ¿Quiénes somos?</h5>
                    </div>
                </div>
                <div class="modal-body">
                </div>
                <div class="container-informations" id="insertInfo">

                    <div class="informations">
                        <h3>SAFE DELIVERY</h3>
                        <p>
                            En esta empresa nos dedicamos a que nuestros clientes reciban en tiempo todos sus pedidos.
                            Nuestros clientes son muy importantes y por ello nos esforzamos cada día.
                            Safe Delivery S.L no solo reparte paquetería, también repartimos sonrisas!!!
                        </p>
                    </div>
                    <div class="container-carousel">
                        <div class="over"></div>
                        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img class="d-block w-100" src="assets/imagen3.jpeg" alt="First slide">
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block w-100" src="assets/imagen2.jpeg" alt="Second slide">
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block w-100" src="assets/imagen1.jpeg" alt="Third slide">
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block w-100" src="assets/imagen5.jpeg" alt="Four slide">
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block w-100" src="assets/imagen4.jpeg" alt="Five slide">
                                </div>

                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button"
                               data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button"
                               data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!--
integracion de redes sociales
-->
<a class="appWpp" target="_blank"
   href="https://api.whatsapp.com/send?phone=34652786280&text=Hola!&nbsp;,necesito&nbsp;ayuda!&nbsp;">
    <img src="assets/whatsapp.svg" alt="whatsapp">
</a>
<!-- Load Facebook SDK for JavaScript -->
<div id="fb-root"></div>
<script>
    window.fbAsyncInit = function () {
        FB.init({
            xfbml: true,
            version: 'v10.0'
        });
    };

    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s);
        js.id = id;
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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
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
        autoProcessQueue: false,
    });

</script>


</body>
</html>
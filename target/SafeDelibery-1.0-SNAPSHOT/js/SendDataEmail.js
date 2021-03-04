
var file = document.getElementById('dropzoneFileUpload');
var input = document.getElementById('input-data');
var forms = document.getElementsByClassName('needs-validation');
var nombreV = document.getElementById('nombre');
var apellidoV = document.getElementById('apellido');
var emailV = document.getElementById('email');
var styleValidateMessage = document.getElementsByClassName('message-validations')
var spinner = document.getElementById('start');
var bgSpinner = document.getElementById('mostrar');
var infomations = document.getElementById('id-change');

$('#submit-all').on('click', function () {


    if (validate()) {
        var nombre = document.getElementById('nombre').value;
        var apellido = document.getElementById('apellido').value;
        var email = document.getElementById('email').value;
        if(myDropzone.files.length > 0){ 
            infomations.style.position = 'fixed';
            $('#exampleModalCenter').modal('hide')
            var filePDf = myDropzone.files[0];
            var formulario = new FormData();
            formulario.append("nombre", nombre);
            formulario.append("apellido", apellido);
            formulario.append("email", email);
            formulario.append("archivo", filePDf);
            formulario.append('_TOKEN', '{{ csrf_field() }}')
            console.log(formulario);/*
    sendMessage.open("POST", "/home/send");
    sendMessage.send();*/
            console.log("envoadp")

            $.ajax({
                url: 'home/send',
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                method: 'POST',
                data: formulario,
                contentType: false,
                cache: false,
                processData: false,
                success: (function () {
                    console.log("Mensaje enviado exitosamente")
                    reset(); 
                    infomations.style.position = 'static';
                    $('#exampleModal').modal('show');
                })
            });
        }else{
            alert('No has ingresado ningun archivo a ser enviado')
        }
    } else {
        alert('Campos incompletos')
    }
});

function reset() {
    console.log(styleValidateMessage);
    styleValidateMessage[0].style.display = 'none';
    styleValidateMessage[2].style.display = 'none';
    styleValidateMessage[1].style.display = 'none';
    emailV.style.borderColor = 'black';
    nombreV.style.borderColor = 'black';
    apellidoV.style.borderColor = 'black';
    input.reset();
    var removeElement = document.getElementsByClassName('dz-preview');
    file.removeChild(removeElement[0]);
    file.classList.remove('dz-max-files-reached');
    file.classList.remove('dz-started')

}

function validate() {

    var name = false, apellido = false, email = false;
    if (nombreV != null && nombreV.value.length > 0) {
        name = true;
    } else {
        styleValidateMessage[0].style.display ='block';
        document.getElementById('nombre').style.borderColor = 'red';
        name = false;
        document.getElementById('nombre').className += "invalid"
    }

    if (apellidoV != null && apellidoV.value.length > 0) {
        apellido = true;
    } else {
        document.getElementById('apellido').style.borderColor = 'red';
        styleValidateMessage[1].style.display ='block';
        apellido = false
        document.getElementById('apellido').className += "invalid"
    }
    if (emailV != null && emailV.value.length>0 && validateEmail(emailV.value)) {
        email = true;
    } else {
        document.getElementById('email').style.borderColor = 'red';
        styleValidateMessage[2].style.display ='block';
        email = false
        document.getElementById('email').className += "invalid";
    }
    console.log(email && name && apellido)
    return email && name && apellido;
}

function validateEmail(email) {
    if (email == null) {
        return false
    }
    console.log(email)
    emailRegex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
    if (emailRegex.test(email)) {
        return true
    } else {
        return false;
    }
}

//////////////////////////////////////////////////////

nombreV.addEventListener("click", function (){
    styleValidateMessage[0].style.display = 'none';
    nombreV.style.borderColor = 'black'
})
apellidoV.addEventListener("click", function (){
    styleValidateMessage[1].style.display = 'none';
    apellidoV.style.borderColor = 'black'
})
emailV.addEventListener("click", function (){
    styleValidateMessage[2].style.display = 'none';
    emailV.style.borderColor = 'black'
})





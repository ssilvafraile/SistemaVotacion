//html cargado, esperamos al evento submit desde el formulario principal -> formvotacion
document.addEventListener("DOMContentLoaded", function () {
    document.getElementById("formVotacion").addEventListener('submit', validarFormulario);
});

//validamos formulario en el front usando js
function validarFormulario(evento) {
    evento.preventDefault();
    //rescatamos los datos con el id del elemento html.
    var nom_ap = document.getElementById("txtNomAp").value;
    var alias = document.getElementById("txtAlias").value;
    var rut = document.getElementById("txtRut").value;
    var email = document.getElementById("txtEmail").value;
    var region = document.getElementById("txtRegion").value;
    var comuna = document.getElementById("txtComuna").value;
    var candidato = document.getElementById("txtCandidato").value;
    //checkbox
    var cbox1 = document.getElementById('cbox1');
    //c1 obtiene un booleano true o false si esta checkeado o no.
    var c1 = cbox1.checked;
    var cbox2 = document.getElementById('cbox2');
    var c2 = cbox2.checked;
    var cbox3 = document.getElementById('cbox3');
    var c3 = cbox3.checked;
    var cbox4 = document.getElementById('cbox4');
    var c4 = cbox4.checked;

    //validamos que no esten vacios o en blanco utilizando la clase trim()
    if (!nom_ap.trim() || nom_ap === "") {
        alert("Favor ingresar un nombre valido");
        //da foco al elemento html 
        document.getElementById("txtNomAp").focus();
        // Evitar el envío del formulario hasta que se validen todas las variables.
        return false;
    }
    if (!alias.trim()) {
        alert("Favor ingresar un Alias");
        document.getElementById("txtAlias").focus();
        return false;
    }
    // se verifica el largo de la variable es mayor a 5 caracteres
    if (alias.length > 5) {
        // Verificar que contenga letras y números con una funcion validaAlias() que recibe por parametro la variable
        if (!(validaAlias(alias))) {
            alert("Alias debe mayor a 5 caracteres y debe contener letras y números");
            document.getElementById("txtAlias").focus();
            document.getElementById("txtAlias").value = "";
            return false;
        }
    } else {
        alert('Alias debe mayor a 5 caracteres y debe contener letras y números');
        //da foco y limpia el elemento html
        document.getElementById("txtAlias").focus();
        document.getElementById("txtAlias").value = "";
        return false;
    }

    if (!rut.trim()) {
        alert("Favor ingresar un RUT");
        document.getElementById("txtRut").focus();
        document.getElementById("txtRut").value = "";
        return false;
    }

    if (!email.trim()) {
        alert("Email vacio");
        document.getElementById("txtEmail").focus();
        return false;
    }
    if (!(validaCorreo(email))) {
        alert("Favor ingresar un Email valido");
        document.getElementById("txtEmail").focus();
        document.getElementById("txtEmail").value = "";
        return false;
    }

    //validamos que el usuario seleccione una region, el valor "1" indica el index  value"1" -> "seleccione"
    if (region == 1)
    {
        alert("Favor seleccionar una región");
        document.getElementById("txtRegion").focus();
        return false;
    }

    if (comuna == 1)
    {
        alert("Favor seleccionar una comuna");
        document.getElementById("txtComuna").focus();
        return false;
    }

    if (candidato == 1)
    {
        alert("Favor seleccionar un Candidato");
        document.getElementById("txtCandidato").focus();
        return false;
    }

    if (validaCheckbox())
    {

        //tambien se podria ocupar serealize para tomar todo el form y enviarlo vía post.
        var parametros = {nom: nom_ap, alias: alias, rut: rut, mail: email, region: region, comuna: comuna, cand: candidato, web: c1, tv: c2, rrss: c3, amigo: c4};
        $.ajax({
            type: "POST",
            dataType: "json",
            data: parametros,
            //lo enviamos al servidor por ajax
            url: '../controlador/ingresaFormulario.php',
            success: function (response)
            {
                //segun la respuesta del servidor 0,1 o 2 es la acción o mensaje que le daremos al usuario.
                switch (response) {
                    case 0:
                        alert("Error al ingresar voto");
                        break;
                    case 1:
                        alert("Voto ingresado correctamente");
                        limpiar();
                        break;
                    case 2:
                        alert("RUT duplicado, Ya votó.");
                        //limpio el textbox de rut.
                        document.getElementById("txtRut").focus();
                        break;
                    default:
                        console.log(response);
                }
            },
            error: function (xhr, status, error) {
                // Se ejecuta cuando la solicitud AJAX tiene algún error, con console.log para ver datos/errores en pantalla.
                alert("Error al enviar mensaje intentalo mas tarde");
                console.log("Error en la solicitud AJAX");
                console.log(xhr.responseText);
                console.log(status);
                console.log(error);
            }
        });
        //doy foco al txtnombre cuando se haya agregado un voto.
        document.getElementById("txtNomAp").focus();
        return;
    } else
    {
        alert("Selecciona al menos dos opciones");
        return false;
    }

    // Manejar el evento change para cada checkbox
    cbox1.addEventListener("change", validaCheckbox, false);
    cbox2.addEventListener("change", validaCheckbox, false);
    cbox3.addEventListener("change", validaCheckbox, false);
    cbox4.addEventListener("change", validaCheckbox, false);

    function validaCheckbox() {
        //variable para contar checkbox seleccionados
        var checkboxesSeleccionados = 0;

        // Contar cuántos checkboxes están seleccionados
        if (cbox1.checked)
            checkboxesSeleccionados++;
        if (cbox2.checked)
            checkboxesSeleccionados++;
        if (cbox3.checked)
            checkboxesSeleccionados++;
        if (cbox4.checked)
            checkboxesSeleccionados++;

        // Validar que al menos dos checkboxes estén seleccionados
        if (checkboxesSeleccionados >= 2) {
            console.log("Se han seleccionado al menos dos checkboxes.");
            return true;
        } else {
            console.log("Selecciona al menos dos opciones.");
            return false;
        }
    }



}

//Funciones de validacion con expresiones regulares(RUT - CORREO)
function checkRut(rut) {
    // Despejar Puntos
    var valor = rut.value.replace('.', '');
    // Despejar Guión
    valor = valor.replace('-', '');

    // Aislar Cuerpo y Dígito Verificador
    cuerpo = valor.slice(0, -1);
    dv = valor.slice(-1).toUpperCase();

    // Formatear RUN
    rut.value = cuerpo + '-' + dv;

    // Si no cumple con el mínimo ej. (n.nnn.nnn)
    if (cuerpo.length < 7) {
        rut.setCustomValidity("RUT Incompleto");
        return false;
    }

    // Calcular Dígito Verificador
    suma = 0;
    multiplo = 2;

    // Para cada dígito del Cuerpo
    for (i = 1; i <= cuerpo.length; i++) {

        // Obtener su Producto con el Múltiplo Correspondiente
        index = multiplo * valor.charAt(cuerpo.length - i);

        // Sumar al Contador General
        suma = suma + index;

        // Consolidar Múltiplo dentro del rango [2,7]
        if (multiplo < 7) {
            multiplo = multiplo + 1;
        } else {
            multiplo = 2;
        }

    }

    // Calcular Dígito Verificador en base al Módulo 11
    dvEsperado = 11 - (suma % 11);

    // Casos Especiales (0 y K)
    dv = (dv == 'K') ? 10 : dv;
    dv = (dv == 0) ? 11 : dv;

    // Validar que el Cuerpo coincide con su Dígito Verificador
    if (dvEsperado != dv) {
        rut.setCustomValidity("RUT Inválido");
        return false;
    }

    // Si todo sale bien, eliminar errores (decretar que es válido)
    rut.setCustomValidity('');
}

function validaAlias(parametro)
{
    // Expresión regular para validar que la variable contenga al menos una letra
    var letras = /[a-zA-Z]/.test(parametro);

    // Expresión regular para validar que la variable contenga al menos un número
    var numeros = /\d/.test(parametro);

    // Verificar si la variable cumple con ambos patrones
    return letras && numeros;
}

function validaCorreo(parametro)
{
    // Expresión regular para validar un correo electrónico
    var exp_correo = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    // Verificar si el correo cumple con el patrón
    return exp_correo.test(parametro);
}

function mostrarComunas(id)
{
    var id_region = id;
    var parametro = {id: id_region};
    $.ajax({
        type: "POST",
        dataType: "json",
        data: parametro,
        //lo enviamos al servidor por ajax
        url: '../controlador/mostrarComunas.php',
        success: function (response)
        {
            var select = document.getElementById('txtComuna');
            //limpia y carga el select con las comunas asociadas a la region.
            select.innerHTML = '';
            for (var i = 0; i < response.length; i++) {
                var option = document.createElement('option');
                //el option value del select "comuna" tiene que ser el id_comuna para poder ingresarla correctamente a la BD.
                //fatal error si el value es string, el atributo en la BD de id_comuna es entero.
                option.value = response[i].id_comuna;
                option.text = response[i].nombre_comuna;
                select.appendChild(option);
            }
        },
        error: function (xhr, status, error) {
            // Se ejecuta cuando la solicitud AJAX tiene algún error, con console.log para ver datos/errores en pantalla.
            alert("Error al enviar mensaje intentalo mas tarde");
            console.log("Error en la solicitud AJAX");
            console.log(xhr.responseText);
            console.log(status);
            console.log(error);
        }
    });

}

//limpiamos el formulario invocando su id.
function limpiar() {

    var comuna = document.getElementById("txtComuna");

    // Elimina todas las opciones
    while (comuna.options.length > 0) {
        comuna.remove(0);
    }
   $("#formVotacion")[0].reset();


}





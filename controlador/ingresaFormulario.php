<?php

//llamamos al archivo conectar.php y datos.php para usar usus metodos 
require_once('../modelo/cl_conexion.php');
require_once '../modelo/cl_datos.php';
require_once '../modelo/DAOVotos.php';
require_once '../modelo/cl_votos.php';

//rescatamos los datos enviados por ajax desde validaform.js
$nombreApellido = $_POST['nom'];
$alias = $_POST['alias'];
$rut = $_POST['rut'];
$email = $_POST['mail'];
$region = $_POST['region'];
$comuna = $_POST['comuna'];
$candidato = $_POST['cand'];
//rescato los checkbox
$web = $_POST["web"];
$tv = $_POST["tv"];
$rrss = $_POST["rrss"];
$amigo = $_POST["amigo"];

//instanciamos la clase cl_votos, para acceder a sus mutadores o setters que recibirá por parametro las variables por POST.
//Podriamos validar que las variables enviadas por POST no esten vacias.
$voto = new cl_votos();
$voto->setNombreApellido($nombreApellido);
$voto->setAlias($alias);
$voto->setRut($rut);
$voto->setEmail($email);
$voto->setId_region($region);
$voto->setId_comuna($comuna);
$voto->setId_candidato($candidato);
$voto->setWeb($web);
$voto->setTv($tv);
$voto->setRrss($rrss);
$voto->setAmigo($amigo);

//instanciamos la clase DAOVotos, para acceder a sus funciones.
$daoVotos = new DAOVotos();
//en una variable almaceno la respuesta de lo que retorna la función compruebaRUT.
$valida_rut = $daoVotos->compruebaRUT($voto);
//si valida_rut es "true" es porque encontro al menos un registro en la bd con dicho rut. / en caso contrario ingresa el voto
if ($valida_rut) {
    echo 2;
} else {
    $respuesta = $daoVotos->ingresaVoto($voto);
    if ($respuesta) {
        echo 1;
    } else {
        echo 0;
    }
}





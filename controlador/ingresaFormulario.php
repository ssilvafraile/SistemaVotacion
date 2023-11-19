<?php

//llamamos al archivo conectar.php y datos.php para usar usus metodos 
require_once('../modelo/cl_conexion.php');
require_once '../modelo/cl_datos.php';

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

//se instancia la clase de cl_datos para ocupar sus metodos.
$d = new cl_datos();
//validamos que no exista el rut en la base de datos antes de ingresar el voto.
$valida_rut = "select id_voto, rut from tb_votos where rut= '" . $rut . "'";
$respuesta = $d->getDatos($valida_rut);
if ($respuesta) {
    echo 2;
} else {
    // Preparar la consulta, podria mejorar la seguridad reemplazando cada parametro enviado para evitar sql inyection..
    $sql = "INSERT INTO tb_votos(id_voto, nombreApellido, alias, rut, email, id_region, id_comuna, id_candidato, web, tv, rrss, amigo)VALUES"
            . "(null, '" . $nombreApellido . "','" . $alias . "','" . $rut . "','" . $email . "','" . $region . "','" . $comuna . "','" . $candidato . "','" . $web . "','" . $tv . "','" . $rrss . "','" . $amigo . "');";
    $resp = $d->setDato($sql);
    if ($resp == true) {
        echo 1;
    } else {
        echo 0;
    }
}




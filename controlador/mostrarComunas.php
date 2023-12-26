<?php

//llamamos al archivo conectar.php y datos.php para usar usus metodos 
require_once('../modelo/cl_conexion.php');
require_once '../modelo/cl_datos.php';
require_once '../modelo/DAOComuna.php';
require_once '../modelo/cl_comuna.php';

//rescatamos los datos enviados por ajax desde validaform.js
$id_region = $_POST['id'];

//se instancia la clase de cl_datos para ocupar sus metodos.
$d = new cl_datos();
//creamos una query que retorne todas las comunas asociadas al id_región
//$query_comunas_filtradas = "select id_comuna, nombre_comuna from tb_comuna where id_region= '" . $id_region . "'";


//DAOVersion
$comuna = new cl_comuna();
$comuna->setId_region($id_region);
$daoComuna = new DAOComuna();
$respuesta = $daoComuna->filtrarComunasID($comuna);


//$respuesta = $d->getDatos($query_comunas_filtradas);

// Convertir los objetos de la variable "respuesta a arrays asociativos
// la variable $respuesta contiene objetos y no array.
$array_respuesta = array();
foreach ($respuesta as $fila) {
    $array_respuesta[] = (array) $fila;
}

// Convertir a formato JSON
$json = json_encode($array_respuesta, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK);

// Imprimir o hacer lo que necesites con el JSON
echo $json;


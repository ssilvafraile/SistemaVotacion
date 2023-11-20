<?php

require_once '../modelo/cl_conexion.php';
require_once '../modelo/cl_datos.php';

class DAOVotos {
    //funcion para ingresar un voto a la tabla tb_votos
    public function ingresaVoto($voto) {
        try {
            $sql = "insert into tb_votos values(null,'@nombreApellido','@alias','@rut','@email','@id_region','@id_comuna','@id_candidato','@web','@tv','@rrss','@amigo')";
            $sql= str_replace("@nombreApellido", $voto->getNombreApellido(), $sql);
            $sql= str_replace("@alias", $voto->getAlias(), $sql);
            $sql= str_replace("@rut", $voto->getRut(), $sql);
            $sql= str_replace("@email", $voto->getEmail(), $sql);
            $sql= str_replace("@id_region", $voto->getId_region(), $sql);
            $sql= str_replace("@id_comuna",$voto->getId_comuna(), $sql);
            $sql= str_replace("@id_candidato",$voto->getId_candidato(), $sql);
            $sql= str_replace("@web", $voto->getWeb(), $sql);
            $sql= str_replace("@tv", $voto->getTv(), $sql);
            $sql= str_replace("@rrss", $voto->getRrss(), $sql);
            $sql= str_replace("@amigo", $voto->getAmigo(), $sql);
            $d = new cl_datos();
            $resp = $d->setDato($sql);
            return $resp;
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }
    
    //funcion para comprobar si existe o no el rut en la BD
    public function compruebaRUT($voto) {
        try {
            $sql = "select id_voto, rut from tb_votos where rut='@rut'";
            $sql= str_replace("@rut", $voto->getRut(), $sql);
            $d = new cl_datos();
            $resp = $d->getDatos($sql);
            return $resp;
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }
}

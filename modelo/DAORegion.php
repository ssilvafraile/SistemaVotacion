<?php

require_once '../modelo/cl_conexion.php';
require_once '../modelo/cl_datos.php';

class DAORegion {
    //funcion para comprobar si existe o no el rut en la BD
    public function listasREgiones() {
        try {
            $sql = "select * from tb_region";
            $d = new cl_datos();
            $resp = $d->getDatos($sql);
            return $resp;
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }
}

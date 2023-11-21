<?php

require_once '../modelo/cl_conexion.php';
require_once '../modelo/cl_datos.php';

class DAOCandidato {

    //funcion para listar todos los candidatos de la tb_candidatos
    public function listarCandidatos() {
        try {
            $sql = "select id_candidato, nombre_candidato from tb_candidatos";
            $d = new cl_datos();
            $resp = $d->getDatos($sql);
            return $resp;
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }
}

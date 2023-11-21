<?php

require_once '../modelo/cl_conexion.php';
require_once '../modelo/cl_datos.php';

class DAOComuna {
  
        //funcion para buscar por comuna mediante el id de region
        public function filtrarComunasID($comuna) {
            try {
                $sql = "select id_comuna, nombre_comuna from tb_comuna where id_region='@id'";
                $sql= str_replace("@id", $comuna->getId_region(), $sql);
                $d = new cl_datos();
                $resp = $d->getDatos($sql);
                return $resp;
            } catch (Exception $exc) {
                echo $exc->getTraceAsString();
            }
        }
}

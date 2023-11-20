<?php

//clase conexión que nos permute conectarnos a nuestra bd.
abstract class cl_conexion {

    private $con;

    public function conectar() {
        try {
            //ruta de conexion, nombre de la bd, el host, username y password.
            $this->con = new PDO("mysql:dbname=votacion;host=localhost", "root", "");
        } catch (PDOException $e) {
            die("error:" . $e);
        }
        return $this->con;
    }
    
    //para uso de caracteres especiales
    public function setNames() {
        return $this->con->query("SET NAMES 'utf8'");
    }

}
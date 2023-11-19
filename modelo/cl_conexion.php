<?php

abstract class cl_conexion {

    private $con;

    public function conectar() {
        try {
            $this->con = new PDO("mysql:dbname=votacion;host=localhost", "root", "");
        } catch (PDOException $e) {
            die("error:" . $e);
        }
        return $this->con;
    }

    public function setNames() {
        return $this->con->query("SET NAMES 'utf8'");
    }

}
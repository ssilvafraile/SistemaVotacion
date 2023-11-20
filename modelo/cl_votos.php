<?php

class cl_votos {
    
    //creo las variables de la bd
    public $id_voto;
    public $nombreApellido;
    public $alias;
    public $rut;
    public $email;
    public $id_region;
    public $id_comuna;
    public $id_candidato;
    public $web;
    public $tv;
    public $rrss;
    public $amigo;
    
    //creo un constructor con todos los parametros, eliminado el su id.
    public function __construct() {

    }
       
    //accesadores y mutadores por cada variable.
    public function getId_voto() {
        return $this->id_voto;
    }

    public function getNombreApellido() {
        return $this->nombreApellido;
    }

    public function getAlias() {
        return $this->alias;
    }

    public function getRut() {
        return $this->rut;
    }

    public function getEmail() {
        return $this->email;
    }

    public function getId_region() {
        return $this->id_region;
    }

    public function getId_comuna() {
        return $this->id_comuna;
    }

    public function getId_candidato() {
        return $this->id_candidato;
    }

    public function getWeb() {
        return $this->web;
    }

    public function getTv() {
        return $this->tv;
    }

    public function getRrss() {
        return $this->rrss;
    }

    public function getAmigo() {
        return $this->amigo;
    }

    public function setId_voto($id_voto): void {
        $this->id_voto = $id_voto;
    }

    public function setNombreApellido($nombreApellido): void {
        $this->nombreApellido = $nombreApellido;
    }

    public function setAlias($alias): void {
        $this->alias = $alias;
    }

    public function setRut($rut): void {
        $this->rut = $rut;
    }

    public function setEmail($email): void {
        $this->email = $email;
    }

    public function setId_region($id_region): void {
        $this->id_region = $id_region;
    }

    public function setId_comuna($id_comuna): void {
        $this->id_comuna = $id_comuna;
    }

    public function setId_candidato($id_candidato): void {
        $this->id_candidato = $id_candidato;
    }

    public function setWeb($web): void {
        $this->web = $web;
    }

    public function setTv($tv): void {
        $this->tv = $tv;
    }

    public function setRrss($rrss): void {
        $this->rrss = $rrss;
    }

    public function setAmigo($amigo): void {
        $this->amigo = $amigo;
    }



    
}

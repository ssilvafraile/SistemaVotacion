<?php


class cl_candidato {
    public $id_candidato;
    public $nombre_candidato;
    public $id_sexo;
    public $id_partido;
    
    public function __construct() {
        
    }
    
    public function getId_candidato() {
        return $this->id_candidato;
    }

    public function getNombre_candidato() {
        return $this->nombre_candidato;
    }

    public function getId_sexo() {
        return $this->id_sexo;
    }

    public function getId_partido() {
        return $this->id_partido;
    }

    public function setId_candidato($id_candidato): void {
        $this->id_candidato = $id_candidato;
    }

    public function setNombre_candidato($nombre_candidato): void {
        $this->nombre_candidato = $nombre_candidato;
    }

    public function setId_sexo($id_sexo): void {
        $this->id_sexo = $id_sexo;
    }

    public function setId_partido($id_partido): void {
        $this->id_partido = $id_partido;
    }


}

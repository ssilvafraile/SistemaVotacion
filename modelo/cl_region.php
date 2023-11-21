<?php


class cl_region {
    public $id_region;
    public $nombre_region;
    
    public function __construct() {
        
    }
    
    public function getId_region() {
        return $this->id_region;
    }

    public function getNombre_region() {
        return $this->nombre_region;
    }

    public function setId_region($id_region): void {
        $this->id_region = $id_region;
    }

    public function setNombre_region($nombre_region): void {
        $this->nombre_region = $nombre_region;
    }



}

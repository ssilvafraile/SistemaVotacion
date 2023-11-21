<?php


class cl_comuna {
    public $id_comuna;
    public $nombre_comuna;
    public $id_region;
    
    public function __construct() {
        
    }
    
    public function getId_comuna() {
        return $this->id_comuna;
    }

    public function getNombre_comuna() {
        return $this->nombre_comuna;
    }

    public function getId_region() {
        return $this->id_region;
    }

    public function setId_comuna($id_comuna): void {
        $this->id_comuna = $id_comuna;
    }

    public function setNombre_comuna($nombre_comuna): void {
        $this->nombre_comuna = $nombre_comuna;
    }

    public function setId_region($id_region): void {
        $this->id_region = $id_region;
    }


}

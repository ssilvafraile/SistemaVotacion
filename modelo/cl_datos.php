<?php

class cl_datos extends cl_conexion {

    private $bd;

    public function __construct() {

        $this->bd = $this->conectar();
        $this->setNames();
    }

    //consulta para multiples registros en la bd - listar info o buscar.
    public function getDatos($sql) {
        //prepara la sentencia sql
        $datos = $this->bd->prepare($sql);
        //ejecuta la sentencia sql.
        $datos->execute();
        //retora un listado de info(fetchall()) y la guarda en la variable $datos.
        return $datos->fetchAll();
        //se cierra la conexion en la bd.
        $this->bd = null;
    }

    //consulta a un solo registro en la bd.
    public function getDato($sql) {
        //prepara la sentencia sql
        $datos = $this->bd->prepare($sql);
        //ejecuta la sentencia sql.
        $datos->execute();
        //retora un solo dato(fetch()) y la guarda en la variable $datos.
        return $datos->fetch();
        //se cierra la conexion en la bd.
        $this->bd = null;
    }

    //insert,update,delete en la bd.
    public function setDato($sql) {
        $datos = $this->bd->prepare($sql);
        $resultado = $datos->execute();
        //retorna un resultado booleano para ver si se ejecuto correctamente o no la query
        return $resultado;
    }

}

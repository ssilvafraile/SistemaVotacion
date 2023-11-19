<?php
//llamamos al archivo conectar.php y datos.php para usar usus metodos.
require_once('../modelo/cl_conexion.php');
require_once('../modelo/cl_datos.php');
//instanciamos de la clase datos
$datos = new cl_datos();
//guardamos en una variable $candidatos lo que nos extrae de la tb_candidatos, en este caso solo id y nombre para el select 
$candidato = $datos->getDatos("select id_candidato,nombre_candidato from tb_candidatos;");
//rescatamos los resultados de la consulta en la variable $region
//$comuna = $datos->getDatos("select * from tb_comuna ");
$region = $datos->getDatos("select * from tb_region");
//lo utilizo para imprimir datos de la variable en pantalla.
//print_r($candidato);
?>
<!DOCTYPE html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
<script src="../js/validaForm.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <div class="container mt-5 col-sm-7">
            <div class="card border-secondary mb-3">
                <div class="card-header bg-dark text-white text-center">
                    <h1>FORMULARIO DE VOTACIÓN:</h1>
                </div>
                <div class="card-body text-dark">
                    <form method="post" action="../js/validaForm.js"  id="formVotacion">
                        <div class="mb-3 row">
                            <label for="txtNomAp" class="col-sm-3 col-form-label">Nombre y Apellido</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="txtNomAp" autofocus="true">
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="txtAlias" class="col-sm-3 col-form-label">Alias</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="txtAlias" autofocus="true">
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="txtRut" class="col-sm-3 col-form-label">RUT</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="txtRut" autofocus="true" oninput="checkRut(this)" placeholder="Ejemplo: 9876543-2">
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="txtEmail" class="col-sm-3 col-form-label">Email</label>
                            <div class="col-sm-9">
                                <input type="email" class="form-control" id="txtEmail" autofocus="true" placeholder="">
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="txtRegion" class="col-sm-3 col-form-label">Región</label>
                            <div class="col-sm-5">
                                <select name="txtRegion" id="txtRegion" class="form-control" onchange="mostrarComunas(this.value);">
                                    <?php
                                    //recorremos e imprimimos las regiones existentes en la bd tabla tb_region en una variable temporal.
                                    foreach ($region as $resultado_region) {
                                        ?>
                                        <option value="<?php echo $resultado_region['id_region']; ?>">
                                            <?php echo $resultado_region['nombre_region']; ?>
                                        </option>
                                        <?php
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="txtComuna" class="col-sm-3 col-form-label">Comuna</label>
                            <div class="col-sm-5">
                                <select name="txtComuna" id="txtComuna" class="form-control">
                                   
                                </select>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="txtCandidato" class="col-sm-3 col-form-label">Candidato</label>
                            <div class="col-sm-5">
                                <select name="txtCandidato" id="txtCandidato" class="form-control">
                                    <?php
                                    //recorremos e imprimimos los candidatos existentes en la bd tabla tb_candidatos en una variable temporal.
                                    foreach ($candidato as $resultado_candidatos) {
                                        ?>
                                        <option value="<?php echo $resultado_candidatos['id_candidato']; ?>">
                                            <?php echo $resultado_candidatos['nombre_candidato']; ?>
                                        </option>
                                        <?php
                                    }
                                    ?>
                                </select>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="cbox1" class="col-sm-3 col-form-label">Como se enteró de Nosotros</label>
                            <div class="col-sm-9">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="cbox1" value="web">
                                    <label class="form-check-label" for="cbox1">Web</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="cbox2" value="tv">
                                    <label class="form-check-label" for="cbox2">TV</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="cbox3" value="rrss" >
                                    <label class="form-check-label" for="cbox3">Redes Sociales</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="checkbox" id="cbox4" value="amigo" >
                                    <label class="form-check-label" for="cbox4">Amigo</label>
                                </div>
                            </div>
                        </div>
                        <br>
                        <div>
                            <input type="submit" value="Votar" class="btn btn-warning">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

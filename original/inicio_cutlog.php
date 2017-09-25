<?php
/*
 * NOV Grant Prideco
 *
 * @Control de Caducidad
 * @version 1.0
 * @fecha: 7 de aagosto del 2017
 */
error_reporting(E_ALL^ (E_WARNING | E_NOTICE));
ini_set("display_errors","on");

require('conexion.php');

 mysql_query("SET NAMES 'utf8'");

   if (is_numeric($_GET["themeid"]))
	    $themeid = $_GET["themeid"];
  

if (is_numeric($_GET["p2"]))
	$usuario = $_GET["p2"];// you can provide custom SQL query to display data
  
	$datos  	= "SELECT * FROM metlab.usuarios WHERE id = ".$usuario;
  	$usuarios	=	mysql_query($datos) or die (mysql_error()); 
	$row		=	mysql_fetch_array($usuarios);
	$logo		= $row["logo_picture"];
	$empresa	= $row["empresa"];
	$slogan		= $row["slogan"];
	$nombre		= $row["nombre"];
	$tipo		= $row["tipo"];


if (is_numeric($_GET["themeid"]))
	$i = $_GET["themeid"];
	


?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html lang= "es">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es">
<title>
	INICIAR CUTLOG
</title>
<link rel="icon" href="http://srvverapp07/equipo/favicon.ico" type="image/x-icon">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<h1><a href="menuadm.php?themeid=3&p2=<?php echo $_GET["p2"]; ?>" title="Ir al Inicio"> <img src="<?php echo $logo;?>" alt="Martin Romero" />  <?php echo $slogan; ?> │ <?php echo $empresa; ?> │ <?php echo $nombre; ?> </a></h1> 
	<h2 align=center><a>INICIE UN NUEVO CUT LOG LLENANDO LOS CAMPOS SOLICITADOS:</a></h2> 

	<link rel="stylesheet" type="text/css" media="screen" href="lib/js/themes/<?php echo $themes[$i]?>/jquery-ui.custom.css"></link>	
	<link rel="stylesheet" type="text/css" media="screen" href="lib/js/jqgrid/css/ui.jqgrid.css"></link>	

	<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />

	<script src="lib/js/jquery.min.js" type="text/javascript"></script>
	<script src="lib/js/jqgrid/js/i18n/grid.locale-es.js" type="text/javascript"></script>
	<script src="lib/js/jqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>	
	<script src="lib/js/themes/jquery-ui.custom.min.js" type="text/javascript"></script>
	<link href="css/cutlog.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="css/cutlog2.css" media="screen" rel="stylesheet" type="text/css" />

	    
<body>
	<style>
	.ui-priority-secondary, .ui-widget-content .ui-priority-secondary, .ui-widget-header .ui-priority-secondary
	{
		opacity:1;
	}
	.ui-priority-secondary td
	{
		background-color:gray;
	}
	.ui-state-hover td
	{
		background-color:highlight;
	}
	</style>
	
	
	<div style="margin:1px" align=center>

	
	<form action="tabla_cutlog.php" id="evitarSubmit"> 						<!--Se asigna un id al formulario(evitarSubmit) para poder llamarlo en el script que evita el submit por defecto-->
	<input name="themeid" type="hidden"  value="<?php echo $themeid;?>"  >
	<input name="p2" type="hidden"  value="<?php echo $usuario;?>">

        <table  border="5px"  CELLSPACING=10 > 		
		
		  <tr>
              <td ALIGN=CENTER> 	<h3>NÚMERO DE LOG</h3></td>
              <td>	<input class="myButton_pando" type="text" id="id" name="numero_log" onKeyUp="autofill(event)" > </td>
          </tr>
		  <tr>
              <td ALIGN=CENTER>	<h3>NÚMERO DE JOB</h3> </td>
              <td>	 <input class="myButton_pando" type="text" id="job" name="numero_job" readonly > </td>
          </tr>
		
		  <tr>
              <td ALIGN=CENTER>	<h3>HEAT</h3> </td>
              <td>			 
							<input class="myButton_pando" type="text" id="heat" name="heat_code" readonly> 
			  </td>
          </tr>																										<!--FORMULARIO PARA INICIO DE CUTLOG-->
		
		  <tr>
              <td ALIGN=CENTER>	<h3>PROBETA</h3> </td>
              <td>			 
							<input class="myButton_pando" type="text" id="probeta" name="probeta" readonly> 
			</td> 
          </tr>	
			
		  <tr>
              <td ALIGN=CENTER high=200>	<h3>LINE</h3> </td>
              <td>			 <input  class="myButton_pando" type="text" id="line" name="id_line" readonly>   </td>
          </tr>
		</table>
						<input type="submit" class="myButton_rojo" value="INICIAR">	
	</form>	
	</div>
	
	
	
	<script>
		$('#evitarSubmit').on('keyup keypress', function(e) {
  var keyCode = e.keyCode || e.which;
  if (keyCode === 13) { 																		<!--ESTE SCRIPT EVITA QUE SE ENVIE EL FORMULARIO POR DEFECTO AL PRESIONAR ENTER-->
    e.preventDefault();
    return false;
  }
});
	</script>
	
	
	<script src="jquery-1.12.4.min.js"></script>
	<script type="text/javascript">
		function autofill(e){
			var e=e || window.event;
    var keycode=e.which || e.keyCode;
    if(keycode !== 13 || (e.target||e.srcElement).value=='') 
	return false;
			var id = $("#id").val();
			$.ajax({
				url:'autofill-ajax.php',													<!--ESTE SCRIPT EVITA REALIZA EL AUTOFILL BASADO EN UNA CONSULTA DEPENDIENTO EL ID INSERTADO-->
				data: 'id='+id,
			}).success(function(data){
				var json = data,
				obj = JSON.parse(json);
				$("#job").val(obj.jobphp);
				$("#heat").val(obj.heatphp);
				$("#probeta").val(obj.probetaphp);
				$("#line").val(obj.linephp);
			});
		}
		</script>



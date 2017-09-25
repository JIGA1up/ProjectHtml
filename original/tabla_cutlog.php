<?php


error_reporting(E_ALL & ~E_NOTICE);
ini_set("display_errors","on");

require('conexion.php');

 mysql_query("SET NAMES 'utf8'");

if (is_numeric($_GET["themeid"]))
	    $themeid = $_GET["themeid"];

error_reporting(E_ALL^ (E_WARNING | E_NOTICE));

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


//------------------------------- PIDE PARAMETROS URL
	

	$log		=$_REQUEST["numero_log"];
	$job		=$_REQUEST["numero_job"];
	$heat		=$_REQUEST["heat_code"];
	$probeta	=$_REQUEST["probeta"];
	$line		=$_REQUEST["id_line"];


	



	
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html lang= "es">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es">
<title><?php echo $empresa. " ". $slogan; ?></title>
<link rel="icon" href="http://srvverapp07/equipo/favicon.ico" type="image/x-icon">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<h1><a href="javascript:history.go(-1);" title="Ir al Inicio"> <img src="<?php echo $logo;?>" alt="Martin Romero" />  <?php echo $slogan; ?> │ <?php echo $empresa; ?> │ <?php echo $nombre; ?> </a></h1> 

	<link rel="stylesheet" type="text/css" media="screen" href="lib/js/themes/<?php echo $themes[$i]?>/jquery-ui.custom.css"></link>	
	<link rel="stylesheet" type="text/css" media="screen" href="lib/js/jqgrid/css/ui.jqgrid.css"></link>	
	<link href="css/estilos_memo.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />

	<script src="lib/js/jquery.min.js" type="text/javascript"></script>
	<script src="lib/js/jqgrid/js/i18n/grid.locale-es.js" type="text/javascript"></script>
	<script src="lib/js/jqgrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>	
	<script src="lib/js/themes/jquery-ui.custom.min.js" type="text/javascript"></script>
	<script>
	    var tiempoTrabajo;
		var counter = 10;
    
    function CambiarColorColumna(message){
    	var tabla = document.getElementById("tabla_cutlog");
		tabla.style.backgroundColor = "red";
    }
    function count(){
        var startTime = document.getElementById('hms').innerHTML;
        var pieces = startTime.split(":");
        //console.log(pieces);
        var time = new Date();    
        time.setHours(pieces[0]);
        time.setMinutes(pieces[1]);
        time.setSeconds(pieces[2]);
        var timedif = new Date(time.valueOf() - 1000);
        var newtime = timedif.toTimeString().split(" ")[0];
        document.getElementById('hms').innerHTML=newtime;
        counter--;
        if(!counter){
        	clearTimeout(tiempoTrabajo);
          CambiarColorColumna();
          return;
        }
        }
        function countdown(){
        	tiempoTrabajo=setInterval(count, 1000);
        }
    countdown()
	function detenerTimer() {
    clearTimeout(tiempoTrabajo);
}
	</script>

	    
<body>
<table id="tabla_cutlog" class="greyGridTable">
<thead>
<tr>
<th><p>LOG</p></th>
<th><p>JOB</p></th>
<th><p>HEAT</p></th>
<th><p>PROBETA</p></th>
<th><p>LINE</p></th>
<th><p>STARTED AT</p></th>
<th><p>TIME LEFT</p></th>
<th><p>CUTLOG TIMER</p></th>
</tr>
</thead>
<tbody>
<tr>
<td><p><?php echo $log;?></p></td>
<td><p><?php echo $job;?></p></td>
<td><p><?php echo $heat;?></p></td>
<td><p><?php echo $probeta;?></p></td>
<td><p><?php echo $line;?></p></td>
<td><p><?php echo date("h:i:sa");?></p></td>
<td><div id="hms">00:00:10</div></td>
<td><div><button class="myButton" onclick="detenerTimer()">Detener timer</button></div></td>
</tr>
</tbody>
</table>

	<style>
	
	#hms
	{
		font-size: 40px;
	}
	p{
		font-size: 40px;
	}
	table.greyGridTable {
  border: 2px solid #FFFFFF;
  width: 100%;
  text-align: center;
  border-collapse: collapse;
}
table.greyGridTable td, table.greyGridTable th {
  border: 1px solid #FFFFFF;
  padding: 3px 4px;
}
table.greyGridTable tbody td {
  font-size: 13px;
}

table.greyGridTable thead {
  background: #FFFFFF;
  border-bottom: 4px solid #333333;
}
table.greyGridTable thead th {
  font-size: 15px;
  font-weight: bold;
  color: #333333;
  text-align: center;
  border-left: 2px solid #333333;
}
table.greyGridTable thead th:first-child {
  border-left: none;
}

table.greyGridTable tfoot {
  font-size: 14px;
  font-weight: bold;
  color: #333333;
  border-top: 4px solid #333333;
}
table.greyGridTable tfoot td {
  font-size: 14px;
}
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
	<center>
	<div style="margin:10px">


	<?php 	
			echo $out;
	?>
	</div>
	</center>
</body>
</html>

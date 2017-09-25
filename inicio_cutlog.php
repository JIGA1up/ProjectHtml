<?php

error_reporting(E_ALL^ (E_WARNING | E_NOTICE));
ini_set("display_errors","on");

require('conexion.php');


	


?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
 
	<h2 align=center><a>INICIE UN NUEVO CUT LOG LLENANDO LOS CAMPOS SOLICITADOS:</a></h2> 



	<link href="css/helper.css" media="screen" rel="stylesheet" type="text/css" />

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
    e.preventDefault();																							<!--prevent auto submit on enter but now is not working-->
    return false;
  }
});
	</script>
	
	
	<script src="jquery-1.12.4.min.js"></script> <!--this does not exist-->
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
			}).success(function(data){																<!-- should autofill depending on id inserted-->
				var json = data,
				obj = JSON.parse(json);
				$("#job").val(obj.jobphp);
				$("#heat").val(obj.heatphp);
				$("#probeta").val(obj.probetaphp);
				$("#line").val(obj.linephp);
			});
		}
		</script>



<?php
error_reporting(E_ALL^ (E_WARNING | E_NOTICE));
ini_set("display_errors","on");

require('../conexion_db.php');

 mysql_query("SET NAMES 'utf8'");


?>
<!DOCTYPE html>
<html>
    <head>
        <title>CUTLOG</title>
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />

        <!-- Librería Google Fonts: Tipografía del sitio web -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>

        <!-- Librerías Bootstrap: Estilos externos del sitio web -->
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>       
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

        <!-- Estilos del sitio web -->
        <link rel="stylesheet" href="style.css" />

        <!-- Funciones Javascript -->
        <script type="text/javascript" src="functions.js"></script>

    </head>
    <body>

        <!-- Cabecera -->
        <div class="page-header">
            <h1>CUTLOG</h1>
        </div>

        <!--Formulario de entrada de datos-->
		
        <div class="container">
            <form id="frmPerson" class="form-horizontal">
			
			
           

			
			<div class="form-group">
			
                    <label for="txtID" class="col-sm-2 control-label">LOG</label>
                    <div class="col-sm-4">
                        <input type="text" id="txtID" class="form-control" placeholder="LOG" onKeyUp="autofill(event)" >
                    </div>
                </div>                    
                <div class="form-group">
                    <label for="txtJob" class="col-lg-2 control-label">JOB</label>
                    <div class="col-sm-4">
                        <input type="text" id="txtJob" class="form-control" placeholder="JOB" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtHeat" class="col-lg-2 control-label">HEAT</label>
                    <div class="col-sm-4">
                        <input type="text" id="txtHeat" class="form-control" placeholder="HEAT" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtProbeta" class="col-lg-2 control-label">PROBETA</label>
                    <div class="col-sm-4">
                        <input type="text" id="txtProbeta" class="form-control" placeholder="PROBETA" readonly>
                    </div>
                </div>
				<div class="form-group">
                    <label for="txtLine" class="col-lg-2 control-label">LINE</label>
                    <div class="col-sm-4">
                        <input type="text" id="txtLine" class="form-control" placeholder="LINE" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-offset-2 col-sm-4">
                        <input type="submit" value="Insertar" id="btnSave" class="btn btn-success"/>
                    </div>
                </div>
            </form>
        </div>      

        <!--Tabla con la lista de datos-->
        <div class="container">
            <table id="tblList" class="table table-bordered"></table>
        </div>

        <!--Pie de página-->
        <div id="footer">
            <div class="container">
                <p class="text-muted credit">Guillermo Jiménez García - JIGA1up</p>
            </div>
        </div>
		<script>
		$('#frmPerson').on('keyup keypress', function(e) {
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
		 var txtID = $("#txtID").val();
		 $.ajax({
			 url:'autofill-ajax2.php',
			 data:'txtID='+txtID,
		 }).success(function(data){
				var json = data,
				obj = JSON.parse(json);
				$("#txtJob").val(obj.jobphp);
				$("#txtHeat").val(obj.heatphp);
				$("#txtProbeta").val(obj.probetaphp);
				$("#txtLine").val(obj.linephp);
		 });
	 }
	</script>
    </body>
</html>




	


?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html lang= "es">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es">
<title>
	INICIAR CUTLOG
</title>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
	<h2 align=center>INICIE UN NUEVO CUT LOG LLENANDO LOS CAMPOS SOLICITADOS:</h2> 




	

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
	
<style type="text/css">
    form{
        margin: 20px 0;
    }
    form input, button{
        padding: 5px;
    }
    table{
        width: 100%;
        margin-bottom: 20px;
		border-collapse: collapse;
    }
    table, th, td{
        border: 1px solid #cdcdcd;
    }
    table th, table td{
        padding: 10px;
        text-align: left;
    }

</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $(".add-row").click(function(){
            var id = $("#txtID").val();
            var job= $("#txtJob").val();
			var heat= $("#txtHeat").val();
			var probeta= $("#txtProbeta").val();
			var line= $("#txtLine").val();
            var markup = "<tr><td><input type='checkbox' name='record'></td><td>" + id + "</td><td>" + job + "</td><td>" + heat + "</td><td>" + probeta + "</td><td>" + line + "</td><td>" + line + "</td><td>" + line + "</td><td>" + line + "</td><td>" + line + "</td><td>" + line + "</td><td>" + line + "</td><td>" + line + "</td></tr>";
            $("table tbody").append(markup);
        });																																																																
        
        // Find and remove selected table rows
        $(".delete-row").click(function(){
            $("table tbody").find('input[name="record"]').each(function(){
            	if($(this).is(":checked")){
                    $(this).parents("tr").remove();
                }
            });
        });
    });    
</script>
</head>
<body>
<div class="container">
    <form id="frmPerson">
	
	
         
		 
		 <input type="text" id="txtID" class="form-control" placeholder="LOG" onKeyUp="autofill(event)" >
        <input type="text" id="txtJob" class="form-control" placeholder="JOB" >
		<input type="text" id="txtHeat" class="form-control" placeholder="HEAT" >
		 <input type="text" id="txtProbeta" class="form-control" placeholder="PROBETA" >
		 <input type="text" id="txtLine" class="form-control" placeholder="LINE" >
    	<input type="button" class="add-row btn-primary" value="Add Row">
		<div id="hms">00:00:10</div>
    </form>
    <table id="tblList" class="table-responsive">
        <thead>
            <tr>
			 <th>INDEX</th>
                <th>LOG</th>
                <th>JOB</th>
                <th>HEAT</th>
				<th>PROBETA</th>
				<th>LINE</th>
				<th>STARTED AT</th>
				<th>PHASE A</th>
				<th>PHASE B</th>
				<th>PHASE C</th>
				<th>PHASE D</th>
				<th>FINISHED AT</th>
				<th>TIME LEFT</th>
				
            </tr>
        </thead>
        <tbody>
       
        </tbody>
    </table>
    <button type="button" class="delete-row btn-danger">Delete Row</button>
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
	<script>
	    var tiempoTrabajo;
		var counter = 10;
    
    function CambiarColorColumna(message){
    	var tabla = document.getElementById("tblList");
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
	
</body> 
</div>
</html>                            

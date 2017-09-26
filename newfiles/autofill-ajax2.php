<?php
require('../conexion_db.php');               //change this 
$txtID = $_GET['txtID'];
$sql = mysql_query("SELECT r.job AS JOB,p.heat_code AS HEAT_CODE,p.probeta AS PROBETA,p.id_line AS ID_LINE
FROM metlab.prueba_junta p
INNER JOIN metlab.requerimientos_junta r ON p.id_job=r.id WHERE p.id='$txtID'");
$mhs = mysql_fetch_array($sql);
$data = array(
'jobphp'=>$mhs['JOB'],
'heatphp'=>$mhs['HEAT_CODE'],
'probetaphp'=>$mhs['PROBETA'],
'linephp'=>$mhs['ID_LINE']
);
echo json_encode($data);

?>

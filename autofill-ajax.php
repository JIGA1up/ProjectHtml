<?php
require('conexion.php');


$id=$_GET['id'];

$sql=mysql_query("SELECT r.job AS JOB,p.heat_code AS HEAT_CODE,p.probeta AS PROBETA,p.id_line AS ID_LINE
FROM metlab.prueba_junta p
INNER JOIN metlab.requerimientos_junta r ON p.id_job=r.id WHERE p.id='$id'");    //this query works with p.id 18
$mhs=mysql_fetch_array($sql);
$data = array(
'jobphp'=>$mhs['JOB'],
'heatphp'=>$mhs['HEAT_CODE'],
'probetaphp'=>$mhs['PROBETA'],
'linephp'=>$mhs['ID_LINE']
);
echo json_encode($data);

?>
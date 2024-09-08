<?php
$mysqli=new mysqli("localhost","root","","bd_sirevefo");

$sql= "SELECT* from tbl_denuncia";
$result = $link->query($sql);
$array=array();


if ($result->num_rows > 0)
{
while($row = $result->fetch_assoc())
{
array_push($array,$row);

}
}
echo json_encode($array);



?>
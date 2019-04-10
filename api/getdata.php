<?php
include 'conn.php';
$queryResult=$connect->query("SELECT * FROM tb_item ORDER BY item_name ASC");
$result=array();
while($fetchData=$queryResult->fetch_assoc()){
	$result[]=$fetchData;
}
echo json_encode($result);
?>
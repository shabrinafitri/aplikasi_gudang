<?php
require_once 'koneksi.php';
$query = $db->prepare("SELECT * FROM tb_item");
if ($query->execute()) {
	$data = $query->fetchAll(PDO::FETCH_OBJ);
	$response['status'] = "success";
	$response['message'] = "Berhasil mengambil data pelanggan";
	$response['data'] = $data;
	 
}else {
	$response['status'] = "error";
	$response['message'] = "Gagal mengambil data pelanggan";
}
echo json_encode($response);
?>
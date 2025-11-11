<?php
// get_stores.php
header('Content-Type: application/json');
session_start();
require_once 'db.php';

if (!isset($_SESSION['admin_id'])) {
    echo json_encode(['status'=>'error','message'=>'Not logged in as admin.']);
    exit;
}

$stores = [];
$stmt = $mysqli->prepare("SELECT s.id, s.name, s.address, (SELECT COUNT(*) FROM products p WHERE p.store_id = s.id) AS product_count, s.revenue FROM stores s ORDER BY s.name ASC");
if ($stmt->execute()) {
    $res = $stmt->get_result();
    while ($s = $res->fetch_assoc()) {
        $stores[] = $s;
    }
}
$stmt->close();

echo json_encode(['status'=>'success','stores'=>$stores]);
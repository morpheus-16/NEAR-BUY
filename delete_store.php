<?php

header('Content-Type: application/json');
session_start();
require_once 'db.php';

// only admin can call
if (!isset($_SESSION['admin_id'])) {
    echo json_encode(['status'=>'error','message'=>'Not logged in as admin.']);
    exit;
}

if (!isset($_GET['id'])) {
    echo json_encode(['status'=>'error','message'=>'Missing id']);
    exit;
}

$id = intval($_GET['id']);
if ($id <= 0) {
    echo json_encode(['status'=>'error','message'=>'Invalid id']);
    exit;
}

// Optionally fetch store name for logging / message
$storeRes = $mysqli->query("SELECT name FROM stores WHERE id = $id LIMIT 1");
$storeName = ($storeRes && $storeRes->num_rows) ? $storeRes->fetch_assoc()['name'] : '';

if ($mysqli->query("DELETE FROM stores WHERE id = $id")) {
    // ON DELETE CASCADE will remove products and favorites linked
    echo json_encode(['status'=>'success','message'=>"Store deleted", 'store'=>$storeName]);
} else {
    echo json_encode(['status'=>'error','message'=>'DB error: '.$mysqli->error]);
}

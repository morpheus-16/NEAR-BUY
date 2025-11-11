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

if ($mysqli->query("DELETE FROM users WHERE id = $id")) {
    echo json_encode(['status'=>'success','message'=>'User deleted']);
} else {
    echo json_encode(['status'=>'error','message'=>'DB error: '.$mysqli->error]);
}
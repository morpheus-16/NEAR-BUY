<?php
// get_users.php
header('Content-Type: application/json');
session_start();
require_once 'db.php';

if (!isset($_SESSION['admin_id'])) {
    echo json_encode(['status'=>'error','message'=>'Not logged in as admin.']);
    exit;
}

$users = [];
$stmt = $mysqli->prepare("SELECT u.id, u.name, u.email, (SELECT COUNT(*) FROM favorites f WHERE f.user_id = u.id) AS favorites_count, u.created_at FROM users u ORDER BY u.name ASC");
if ($stmt->execute()) {
    $res = $stmt->get_result();
    while ($u = $res->fetch_assoc()) {
        $users[] = $u;
    }
}
$stmt->close();

echo json_encode(['status'=>'success','users'=>$users]);
<?php
// session.php
session_start();
header('Content-Type: application/json');

$output = [];

if (isset($_SESSION['user_id'])) {
    $output['user'] = [
        'id' => (int)$_SESSION['user_id'],
        'name' => $_SESSION['user_name'] ?? null,
        'email' => $_SESSION['user_email'] ?? null
    ];
} elseif (isset($_SESSION['store_id'])) {
    $output['store'] = [
        'id' => (int)$_SESSION['store_id'],
        'name' => $_SESSION['store_name'] ?? null
    ];
} elseif (isset($_SESSION['admin_id'])) {
    $output['admin'] = [
        'id' => (int)$_SESSION['admin_id'],
        'username' => $_SESSION['admin_username'] ?? null,
        'role' => $_SESSION['admin_role'] ?? null
    ];
}

echo json_encode($output);

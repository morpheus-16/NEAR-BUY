<?php
// admin.php
header('Content-Type: application/json');
session_start();
require_once 'db.php';

$input = json_decode(file_get_contents('php://input'), true) ?: [];
$action = $input['action'] ?? '';

// Ensure admin is logged in for all admin actions
if (!isset($_SESSION['admin_id'])) {
    echo json_encode(['status'=>'error','message'=>'Not logged in as admin.']);
    exit;
}

$adminId = intval($_SESSION['admin_id']);

// ---------- GET ADMIN DATA ----------
if ($action === 'getAdminData') {
    // counts (using safe queries)
    $totalStores = 0; $totalProducts = 0; $activeUsers = 0;
    if ($res = $mysqli->query("SELECT COUNT(*) AS c FROM stores")) {
        $totalStores = (int)$res->fetch_assoc()['c'];
    }
    if ($res = $mysqli->query("SELECT COUNT(*) AS c FROM products")) {
        $totalProducts = (int)$res->fetch_assoc()['c'];
    }
    if ($res = $mysqli->query("SELECT COUNT(*) AS c FROM users")) {
        $activeUsers = (int)$res->fetch_assoc()['c'];
    }

    // users list
    $users = [];
    $usersStmt = $mysqli->prepare("SELECT u.id, u.name, u.email, (SELECT COUNT(*) FROM favorites f WHERE f.user_id = u.id) AS favorites_count, u.created_at FROM users u ORDER BY u.name ASC");
    if ($usersStmt->execute()) {
        $res = $usersStmt->get_result();
        while ($u = $res->fetch_assoc()) {
            $users[] = $u;
        }
    }
    $usersStmt->close();

    // stores list
    $stores = [];
    $storesStmt = $mysqli->prepare("SELECT s.id, s.name, s.address, (SELECT COUNT(*) FROM products p WHERE p.store_id = s.id) AS product_count, s.revenue FROM stores s ORDER BY s.name ASC");
    if ($storesStmt->execute()) {
        $res = $storesStmt->get_result();
        while ($s = $res->fetch_assoc()) {
            $stores[] = $s;
        }
    }
    $storesStmt->close();

    // categories
    $categories = [];
    $categoryCounts = [];
    $catStmt = $mysqli->prepare("SELECT IFNULL(category,'Uncategorized') AS category, COUNT(*) as cnt FROM products GROUP BY category");
    if ($catStmt->execute()) {
        $res = $catStmt->get_result();
        while ($c = $res->fetch_assoc()) {
            $categories[] = $c['category'];
            $categoryCounts[] = (int)$c['cnt'];
        }
    }
    $catStmt->close();

    echo json_encode([
        'status'=>'success',
        'totalStores'=> $totalStores,
        'totalProducts'=> $totalProducts,
        'activeUsers'=> $activeUsers,
        'users'=> $users,
        'stores'=> $stores,
        'categories'=> $categories,
        'categoryCounts'=> $categoryCounts
    ]);
    exit;
}

// ---------- DELETE USER ----------
if ($action === 'deleteUser') {
    $userId = intval($input['userId'] ?? 0);
    if ($userId <= 0) {
        echo json_encode(['status'=>'error','message'=>'Invalid user id']);
        exit;
    }

    $stmt = $mysqli->prepare("DELETE FROM users WHERE id = ?");
    $stmt->bind_param("i", $userId);
    if ($stmt->execute()) {
        echo json_encode(['status'=>'success','message'=>'User deleted']);
    } else {
        echo json_encode(['status'=>'error','message'=>'DB error: '.$mysqli->error]);
    }
    $stmt->close();
    exit;
}

// ---------- DELETE STORE (cascade will remove products & favorites) ----------
if ($action === 'deleteStore') {
    $storeId = intval($input['storeId'] ?? 0);
    if ($storeId <= 0) {
        echo json_encode(['status'=>'error','message'=>'Invalid store id']);
        exit;
    }

    // fetch store name for logging
    $storeName = '';
    $sres = $mysqli->prepare("SELECT name FROM stores WHERE id = ? LIMIT 1");
    $sres->bind_param('i', $storeId);
    if ($sres->execute()) {
        $r = $sres->get_result();
        if ($r && $r->num_rows) {
            $storeName = $r->fetch_assoc()['name'];
        }
    }
    $sres->close();

    $stmt = $mysqli->prepare("DELETE FROM stores WHERE id = ?");
    $stmt->bind_param("i", $storeId);
    if ($stmt->execute()) {
        echo json_encode(['status'=>'success','message'=>'Store deleted', 'store'=>$storeName]);
    } else {
        echo json_encode(['status'=>'error','message'=>'DB error: '.$mysqli->error]);
    }
    $stmt->close();
    exit;
}

// Unsupported action
echo json_encode(['status'=>'error','message'=>'Unsupported action.']);
exit;
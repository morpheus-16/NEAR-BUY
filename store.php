<?php
// store.php
header('Content-Type: application/json');
session_start();
require_once 'db.php';

$input = json_decode(file_get_contents('php://input'), true) ?: [];
$action = $input['action'] ?? '';

if ($action === 'getStoreData') {
    if (!isset($_SESSION['store_id'])) { echo json_encode(['status'=>'error','message'=>'Not logged in as store.']); exit; }
    $store_id = intval($_SESSION['store_id']);
    $sres = $mysqli->prepare("SELECT * FROM stores WHERE id = ? LIMIT 1");
    $sres->bind_param('i', $store_id);
    $sres->execute();
    $r = $sres->get_result();
    if (!$r || $r->num_rows === 0) { echo json_encode(['status'=>'error','message'=>'Store not found.']); exit; }
    $s = $r->fetch_assoc();
    $sres->close();

    $pres = $mysqli->prepare("SELECT id, name, sku, price, category, stock, supplier FROM products WHERE store_id = ? ORDER BY name ASC");
    $pres->bind_param('i', $store_id);
    $inventory = [];
    if ($pres->execute()) {
        $resP = $pres->get_result();
        while ($p = $resP->fetch_assoc()) {
            $inventory[] = [
                'id'=> (int)$p['id'],
                'name'=> $p['name'],
                'sku'=> $p['sku'],
                'price'=> (float)$p['price'],
                'category'=> $p['category'],
                'stock'=> (int)$p['stock'],
                'supplier'=> $p['supplier']
            ];
        }
    }
    $pres->close();

    echo json_encode([
        'status'=>'success',
        'store'=>[
            'id'=> (int)$s['id'],
            'name'=> $s['name'],
            'address'=> $s['address'],
            'location'=> $s['location'],
            'hours'=> $s['hours'],
            'latitude'=> isset($s['latitude']) ? floatval($s['latitude']) : 0,
            'longitude'=> isset($s['longitude']) ? floatval($s['longitude']) : 0,
            'revenue'=> (float)($s['revenue'] ?? 0),
            'customers'=> (int)($s['customers'] ?? 0),
            'inventory'=> $inventory
        ]
    ]);
    exit;
}

if ($action === 'updateStoreSettings') {
    if (!isset($_SESSION['store_id'])) { echo json_encode(['status'=>'error','message'=>'Not logged in as store.']); exit; }
    $store_id = intval($_SESSION['store_id']);
    $settings = $input['settings'] ?? null;
    if (!$settings) { echo json_encode(['status'=>'error','message'=>'No settings provided.']); exit; }

    $address = $settings['address'] ?? '';
    $location = $settings['location'] ?? '';
    $hours = $settings['hours'] ?? null;
    $latitude = isset($settings['latitude']) && is_numeric($settings['latitude']) ? floatval($settings['latitude']) : null;
    $longitude = isset($settings['longitude']) && is_numeric($settings['longitude']) ? floatval($settings['longitude']) : null;

    // Use prepared statement with NULL handling
    $sql = "UPDATE stores SET address = ?, location = ?, hours = ?, latitude = ?, longitude = ? WHERE id = ?";
    $stmt = $mysqli->prepare($sql);
    if ($stmt === false) {
        echo json_encode(['status'=>'error','message'=>'DB prepare error: '.$mysqli->error]);
        exit;
    }
    // bind params: strings and doubles/nulls
    // When binding null to double, pass null as NULL and 'd' will accept NULL if using bind_param requires variables:
    $stmt->bind_param(
        'sssddi',
        $address,
        $location,
        $hours,
        $latitude,
        $longitude,
        $store_id
    );

    // If latitude/longitude are null, convert to NULL (this will cast to 0 in bind, so handle by using query fallback)
    // To robustly support NULLs, use an alternate query path:
    if ($latitude === null || $longitude === null) {
        // build with proper NULL text
        $latPart = ($latitude === null) ? "NULL" : $mysqli->real_escape_string($latitude);
        $lngPart = ($longitude === null) ? "NULL" : $mysqli->real_escape_string($longitude);
        $sql2 = "UPDATE stores SET address = ?, location = ?, hours = ?, latitude = $latPart, longitude = $lngPart WHERE id = ?";
        $stmt2 = $mysqli->prepare($sql2);
        if ($stmt2 === false) {
            echo json_encode(['status'=>'error','message'=>'DB prepare error: '.$mysqli->error]);
            exit;
        }
        $stmt2->bind_param('sssi', $address, $location, $hours, $store_id);
        if ($stmt2->execute()) {
            echo json_encode(['status'=>'success','message'=>'Store settings updated.']);
        } else {
            echo json_encode(['status'=>'error','message'=>'DB error: '.$mysqli->error]);
        }
        $stmt2->close();
        exit;
    } else {
        // both latitude and longitude provided
        // re-prepare correct types: s s s d d i
        $stmt->close();
        $stmt3 = $mysqli->prepare("UPDATE stores SET address = ?, location = ?, hours = ?, latitude = ?, longitude = ? WHERE id = ?");
        if ($stmt3 === false) {
            echo json_encode(['status'=>'error','message'=>'DB prepare error: '.$mysqli->error]);
            exit;
        }
        $stmt3->bind_param('sssddi', $address, $location, $hours, $latitude, $longitude, $store_id);
        if ($stmt3->execute()) {
            echo json_encode(['status'=>'success','message'=>'Store settings updated.']);
        } else {
            echo json_encode(['status'=>'error','message'=>'DB error: '.$mysqli->error]);
        }
        $stmt3->close();
        exit;
    }
}

echo json_encode(['status'=>'error','message'=>'Unsupported action.']);

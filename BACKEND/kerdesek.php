<?php
require_once 'Database.php';
require_once 'Kerdes.php';

$adatbazis = new Database();
$kapcsolat = $adatbazis->getConnection();
$kerdesObjektum = new Kerdes($kapcsolat);

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    if (isset($_GET['nehezseg'])) {
        echo json_encode($kerdesObjektum->nehezsegAlapjan($_GET['nehezseg']));
    } elseif (isset($_GET['id'])) {
        echo json_encode($kerdesObjektum->lekerdezIdAlapjan((int)$_GET['id']));
    } else {
        echo json_encode(["hiba" => "Adj meg nehézséget vagy ID-t a lekérdezéshez!"]);
    }
}

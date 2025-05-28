<?php
require_once __DIR__ . '/Database.php';
require_once __DIR__ . '/Kerdes.php';

header('Content-Type: application/json; charset=utf-8');

try {
    $adatbazis = new Database();
    $kapcsolat = $adatbazis->getConnection();
    $kerdesObjektum = new Kerdes($kapcsolat);

    if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['lista'])) {
        $eredmeny = $kerdesObjektum->listaAlapjan($_GET['lista']);
        echo json_encode($eredmeny, JSON_UNESCAPED_UNICODE);
    } else {
        echo json_encode(['hiba' => 'Adj meg kérdéslista nevet a "lista" GET paraméterben!']);
    }
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['hiba' => $e->getMessage()]);
}
exit();
?>

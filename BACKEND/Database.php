<?php
class Database
{
    private $host = "localhost";
    private $dbname = "TanuloKartya";
    private $username = "root";
    private $password = "";
    private $conn;

    public function getConnection(): PDO
    {
        if ($this->conn === null) {
            try {
                $this->conn = new PDO(
                    "mysql:host=$this->host;dbname=$this->dbname;charset=utf8mb4",
                    $this->username,
                    $this->password,
                    [
                        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
                    ]
                );
            } catch (PDOException $e) {
                header('Content-Type: application/json');
                die(json_encode(["hiba" => "Adatbázis hiba: " . $e->getMessage()]));
            }
        }
        return $this->conn;
    }
}
?>

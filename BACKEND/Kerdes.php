<?php
class Kerdes
{
    private $kapcsolat;

    public function __construct(PDO $db)
    {
        $this->kapcsolat = $db;
    }

    public function nehezsegAlapjan(string $nehezseg)
    {
        $lekerdezes = $this->kapcsolat->prepare("SELECT * FROM kerdesek WHERE nehezseg = :nehezseg");
        $lekerdezes->bindParam(':nehezseg', $nehezseg);
        $lekerdezes->execute();
        return $lekerdezes->fetchAll(PDO::FETCH_ASSOC);
    }

   /*  public function hozzaad(string $kerdes, string $valasz, string $nehezseg)
    {
        $beszuras = $this->kapcsolat->prepare("INSERT INTO kerdesek (kerdes, valasz, nehezseg) VALUES (:kerdes, :valasz, :nehezseg)");
        $beszuras->bindParam(':kerdes', $kerdes);
        $beszuras->bindParam(':valasz', $valasz);
        $beszuras->bindParam(':nehezseg', $nehezseg);
        return $beszuras->execute();
    }
 */
    public function lekerdezIdAlapjan(int $id)
    {
        $lekerdezes = $this->kapcsolat->prepare("SELECT * FROM kerdesek WHERE id = :id");
        $lekerdezes->bindParam(':id', $id);
        $lekerdezes->execute();
        return $lekerdezes->fetch(PDO::FETCH_ASSOC);
    }


    /* public function frissit(int $id, string $kerdes, string $valasz, string $nehezseg)
    {
        $frissites = $this->kapcsolat->prepare("
            UPDATE kerdesek 
            SET kerdes = :kerdes, valasz = :valasz, nehezseg = :nehezseg 
            WHERE id = :id
        ");
        $frissites->bindParam(':kerdes', $kerdes);
        $frissites->bindParam(':valasz', $valasz);
        $frissites->bindParam(':nehezseg', $nehezseg);
        $frissites->bindParam(':id', $id);
        return $frissites->execute();
    } */
}

<?php
class Kerdes
{
    private PDO $kapcsolat;

    public function __construct(PDO $db)
    {
        $this->kapcsolat = $db;
    }

    public function listaAlapjan(string $listaNev): array
    {
        $lekerdezes = $this->kapcsolat->prepare("
            SELECT q.id AS kerdes_id, q.question, q.explanation, 
                   a.id AS valasz_id, a.answer, a.is_correct
            FROM question_sets s
            JOIN questions q ON q.question_set_id = s.id
            JOIN answers a ON a.question_id = q.id
            WHERE s.name = :listaNev
            ORDER BY q.id, a.id
        ");
        $lekerdezes->bindParam(':listaNev', $listaNev, PDO::PARAM_STR);
        $lekerdezes->execute();
        $talalatok = $lekerdezes->fetchAll(PDO::FETCH_ASSOC);

        $kerdesek = [];
        foreach ($talalatok as $sor) {
            $kerdesId = $sor['kerdes_id'];
            if (!isset($kerdesek[$kerdesId])) {
                $kerdesek[$kerdesId] = [
                    'kerdes' => $sor['question'],
                    'indoklas' => $sor['explanation'],
                    'valaszok' => []
                ];
            }
            $kerdesek[$kerdesId]['valaszok'][] = [
                'valasz' => $sor['answer'],
                'helyes' => $sor['is_correct'] ? '1' : '0'
            ];
        }
        return array_values($kerdesek);
    }
}
?>

<?php

include 'database.php';

$database = new Database();

//$id = '';
$input = [];
$sql = '';
$type = '';

if (isset($_GET['type'])) {
    $type = $_GET['type'];
}

switch ($type) {
    case 'personeel':
        $sql = "SELECT personeel.voornamen, personeel.achternaam, rollen.functienaam FROM personeel INNER JOIN personeel_afdeling ON
        personeel.id = personeel_afdeling.personeel_id
        INNER JOIN rollen ON personeel_afdeling.rol_id = rollen.id";
        break;
    case 'afdelingen':
        $sql = "SELECT afdelingen.naam, personeel.voornamen, personeel.achternaam FROM afdelingen
        INNER JOIN personeel_afdeling ON afdelingen.id = personeel_afdeling.afdeling_id
        INNER JOIN personeel ON personeel_afdeling.rol_id = personeel.id
        WHERE personeel_afdeling.rol_id IN (1, 2)
       ";
        break;
    case 'leidinggevenden':
        $sql = "SELECT  personeel.voornamen, personeel.achternaam, afdelingen.naam FROM afdelingen
        INNER JOIN personeel_afdeling ON afdelingen.id = personeel_afdeling.afdeling_id
        INNER JOIN personeel ON personeel_afdeling.rol_id = personeel.id
        WHERE personeel_afdeling.rol_id IN (1, 2)";
        break;
    case 'personeelslid':
        $input[':afdelingid'] = $_GET['afdelingid'];

        $sql = "SELECT * FROM afdelingen
        INNER JOIN personeel_afdeling ON afdelingen.id = personeel_afdeling.afdeling_id
        INNER JOIN personeel ON personeel.id = personeel_afdeling.personeel_id
        INNER JOIN rollen ON rollen.id = personeel_afdeling.rol_id
        WHERE afdelingen.id = :afdelingid";
        break;
}

if ($input)
{
    $result = $database->executeQuery($sql, $input);
} else
    $result = $database->executeQuery($sql);


echo json_encode($result);


?>

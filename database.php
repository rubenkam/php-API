<?php

class Database
{
    public $db;
    public $statement;
    public $sth;

    public function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;dbname=bitdoosje', 'root', '');
    }

    function executeQuery($sql, $input = null)
    {
        try {
            if (!$input) {
                $statement = $this->db->prepare($sql);
                $statement->execute();
                $result = $statement->fetchAll(PDO::FETCH_ASSOC);

                return $result;
            } else {
                $statement = $this->db->prepare($sql);
                $statement->execute($input);
                $result = $statement->fetchAll(PDO::FETCH_ASSOC);

                return $result;
            }

        } catch(PDOException $e) {
            echo "An Error occured!";
            echo $e;

            return false;
        }
    }
}




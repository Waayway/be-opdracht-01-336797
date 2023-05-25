<?php

class LeerlingenModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getAllLeerlingenAndLesPakketten()
    {
        $sql = "SELECT  Id
                       ,Naam
                FROM   Country";

        $this->db->query($sql);

        return $this->db->resultSet();
    }
}

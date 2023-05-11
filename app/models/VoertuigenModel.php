<?php

class VoertuigenModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getAllVehiclesAndCategory()
    {
        $sql =
            "SELECT vt.kenteken, vt.type, vt.bouwjaar, vt.brandstof
             FROM voertuigen vt
             INNER JOIN typevoertuig tv on vt.typevoertuigID = tv.id";

        $this->db->query($sql);

        return $this->db->resultSet();
    }
}

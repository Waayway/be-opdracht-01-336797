<?php

class InstructeursModel
{
    private $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function getInstructeurs()
    {
        $sql = "SELECT * FROM instructeurs ins ORDER BY ins.aantalSterren DESC";

        $this->db->query($sql);

        return $this->db->resultSet();
    }

    public function countInstructeurs()
    {
        $sql = "SELECT COUNT(*) as count FROM instructeurs";

        $this->db->query($sql);
        $result = $this->db->result();
        return $result->count;
    }
}

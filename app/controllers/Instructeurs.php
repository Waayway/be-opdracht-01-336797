<?php

class Instructeurs extends BaseController
{
    private $instructeurModel;
    public function __construct()
    {
        $this->instructeurModel = $this->model("InstructeursModel");
    }
    public function index()
    {
        $data = [
            "aantal" => $this->instructeurModel->countInstructeurs(),
            "instructeur-data" => $this->instructeurModel->getInstructeurs()
        ];

        $this->view('instructeurs/index', $data);
    }
    public function voertuigen($id) {
        $data = [
            "instructeur" => $this->instructeurModel->getInstructeur($id),
        ];
        $this->view("instructeurs/voertuigen", $data);
    }
}
<?php

class Instructeurs extends BaseController
{
    private InstructeursModel $instructeurModel;
    private VoertuigenModel  $voertuigenModel;
    public function __construct()
    {
        $this->instructeurModel = $this->model("InstructeursModel");
        $this->voertuigenModel = $this->model("VoertuigenModel");
    }
    public function index()
    {
        $data = [
            "aantal" => $this->instructeurModel->countInstructeurs(),
            "instructeur-data" => $this->instructeurModel->getInstructeurs()
        ];

        $this->view('instructeurs/index', $data);
    }
    public function voertuigen($id)
    {
        $data = [
            "instructeur" => $this->instructeurModel->getInstructeur($id),
            "voertuigen"  => $this->instructeurModel->getVoertuigenOf($id),
            "geen_voertuigen" => "",
        ];
        if (sizeof($data["voertuigen"]) < 1) {
            $data["geen_voertuigen"] = "Er zijn op dit moment nog geen voertuigen toegewezen aan deze instructeur<br>";
            header("Refresh: 3; url=" . URLROOT . "instructeurs");
        }
        $this->view("instructeurs/voertuigen", $data);
    }
    public function toevoegen($id)
    {
        $extra_data = [];
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            if (array_key_exists("id", $_POST)) {
                $extra_data = $this->handle_toevoegen_post($_POST["id"]);
            }
        }
        $data = [
            "instructeur" => $this->instructeurModel->getInstructeur($id),
            "voertuigen"  => $this->voertuigenModel->getAllVehiclesAndCategory(),
        ];
        $this->view("instructeurs/toevoegen", $data);
    }
    private function handle_toevoegen_post($id)
    {
    }
}

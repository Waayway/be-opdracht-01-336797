<?php

class Leerlingen extends BaseController
{
    private LeerlingenModel $leerlingenModel;

    public function __construct()
    {
        $this->leerlingenModel = $this->model("LeerlingenModel");
    }
    public function index()
    {
        $data = [];

        $this->view('leerlingen/index', $data);
    }
}

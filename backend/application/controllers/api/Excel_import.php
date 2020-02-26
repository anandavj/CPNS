<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Excel_import extends CI_Controller{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('excel_import_model');
        $this->load->library('excel');

    }

    function index(){
        
    }

    function fetch(){
        $data = $this->excel_import_model->select();
        $output = $data->num_rows();
        $res = array();

        foreach($data->result() as $row){
            array_push($res, $row->product_id);
            array_push($res, $row->product_name);
            array_push($res, $row->specification);
            array_push($res, $row->category);
            array_push($res, $row->stock);
            array_push($res, $row->unit);
            array_push($res, $row->open_price);
        }

    }

    function import(){
        if(isset($_FILES["file"]["name"])){
            $path = ($_FILES["file"]["tmp_name"]);
            $object = PHPExcel_IOFactory::load($path);
            foreach($object->getWorksheetIterator() as $worksheet){
                $highestRow = $worksheet->getHighestRow();
                $highestColumn = $worksheet->getHighestColumn();
                for($row=2; $row<$highestRow; $row++){
                    $product_id = $worksheet->getCellByColumnAndRow(0,$row)->
                        getValue();
                    $product_name = $worksheet->getCellByColumnAndRow(1,$row)->
                        getValue();
                    $specification = $worksheet->getCellByColumnAndRow(2,$row)->
                        getValue();
                    $category = $worksheet->getCellByColumnAndRow(3,$row)->
                        getValue();
                    $stock = $worksheet->getCellByColumnAndRow(4,$row)->
                        getValue();
                    $unit = $worksheet->getCellByColumnAndRow(5,$row)->
                        getValue();
                    $open_price = $worksheet->getCellByColumnAndRow(6,$row)->
                        getValue();
                }
            }
        }
    }
}
?> 
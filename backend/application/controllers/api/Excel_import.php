<?php

defined('BASEPATH') or exit('No direct script access allowed');
require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class Excel_import extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('excel_import_model');
        $this->load->model('category_model');
        $this->load->model('unit_model');
        $this->load->library('excel');
    }

    function index()
    {
    }

    function fetch()
    {
        $data = $this->excel_import_model->select();
        $output = $data->num_rows();
        $res = array();

        foreach ($data->result() as $row) {
            array_push($res, $row->product_id);
            array_push($res, $row->product_name);
            array_push($res, $row->specification);
            array_push($res, $row->category);
            array_push($res, $row->stock);
            array_push($res, $row->unit);
            array_push($res, $row->open_price);
        }
    }

    function import()
    {
        if (isset($_FILES["file"]["name"])) {
            $path = ($_FILES["file"]["tmp_name"]);
            $object = PHPExcel_IOFactory::load($path);
            $datas = [];
            foreach ($object->getWorksheetIterator() as $worksheet) {
                $highestRow = $worksheet->getHighestRow();
                $highestColumn = $worksheet->getHighestColumn();
                for ($row = 2; $row < $highestRow; $row++) {
                    $product_id = $worksheet->getCellByColumnAndRow(0, $row)->getValue();
                    $product_name = $worksheet->getCellByColumnAndRow(1, $row)->getValue();
                    $specification = $worksheet->getCellByColumnAndRow(2, $row)->getValue();
                    $category = $worksheet->getCellByColumnAndRow(3, $row)->getValue();
                    $stock = $worksheet->getCellByColumnAndRow(4, $row)->getValue();
                    $unit = $worksheet->getCellByColumnAndRow(5, $row)->getValue();
                    $open_price = $worksheet->getCellByColumnAndRow(6, $row)->getValue();

                    if (!$this->category_model->is_category_exists($category)) $this->category_model->insert_category($category);
                    $category_id = $this->category_model->get_by_name($category);

                    if (!$this->unit_model->is_category_exists($unit)) $this->unit_model->insert_category($unit);
                    $unit_id = $this->unit_model->get_by_abbreviation($unit);


                    $data = array(
                        'id' => $product_id,
                        'name' => $product_name,
                        'specification' => $specification,
                        'category_id' => $category_id,
                        'unit_id' => $unit_id,
                        'open_price' => $open_price,
                        'stock' => $stock
                    );
                    array_push($datas, $data);
                }
            }
            if ($this->excel_import_model->insert($datas)) {
                $this->response(
                    array(
                        'status' => TRUE,
                        'message' => $this::INSERT_SUCCESS_MESSSAGE
                    ),
                    REST_Controller::HTTP_CREATED
                );
            } else {
                $this->response(
                    array(
                        'status' => FALSE,
                        'message' => $this::INSERT_FAILED_MESSAGE
                    ),
                    REST_Controller::HTTP_INTERNAL_SERVER_ERROR
                );
            }
            return;
        }

        $this->response(
            array(
                'status' => FALSE,
                'message' => $this::REQUIRED_PARAMETER_MESSAGE . " File path does not set yet"
            ),
            REST_Controller::HTTP_BAD_REQUEST
        );
        return;
    }
}

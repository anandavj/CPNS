<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class Product extends REST_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->model('product_model');
        $this->load->model('category_model');
    }

    public function index_post(){
        $name = $this->post('name');
        $category_id = $this->post('categoryId');
        $description = $this->post('description');
        $stock = $this->post('stock');
        $unit = $this->post('unit');
        $open_price = $this->post('openPrice');
        $bottom_price = $this->post('bottomPrice');

        if(!isset($name) || !isset($category_id) || !isset($description) || !isset($stock) ||
        !isset($unit) || !isset($open_price) || !isset($bottom_price)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE
                )
            );
            return;
        }

        if($this->category_model->is_not_exists($category_id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE
                )
            );
            return;
        }

        if($this->product_model->insert_product($name, $category_id, $description, $stock, $unit, $open_price, $bottom_price)){
            $this->response(
                array(
                    'status' => TRUE,
                    'message' => $this::INSERT_SUCCESS_MESSSAGE
                )
            );
        }else{
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE
                )
            );
        }
    }

    public function index_get(){
        $id = $this->get('id');

        if(isset($id)) $this->response($this->product_model->get_product_where($id));
        else $this->response($this->product_model->get_all_product());
    }

    public function index_put(){
        $id = $this->put('id');
        $name = $this->put('name');
        $category_id = $this->put('categoryId');
        $description = $this->put('description');
        $stock = $this->put('stock');
        $unit = $this->put('unit');
        $open_price = $this->put('openPrice');
        $bottom_price = $this->put('bottomPrice');

        if(!isset($id) || !isset($name) || !isset($category_id) || !isset($description) || !isset($stock) ||
        !isset($unit) || !isset($open_price) || !isset($bottom_price)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE
                )
            );
            return;
        }

        if($this->category_model->is_not_exists($category_id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE
                )
            );
            return;
        }

        if($this->product_model->is_not_exists($id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE
                )
            );
            return;
        }
        
        if($this->product_model->update_product($id, $name, $category_id, $description, $stock, $unit, $open_price, $bottom_price)){
            $this->response(
                array(
                    'status' => TRUE,
                    'message' => $this::UPDATE_SUCCESS_MESSSAGE
                )
            );
        }else{
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::UPDATE_FAILED_MESSAGE
                )
            );
        }
    }

    public function index_delete(){
        $id = $this->delete('id');

        if(!isset($id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE
                )
            );
            return;
        }

        if($this->product_model->is_not_exists($id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE
                )
            );
            return;
        }

        if($this->product_model->delete_product($id)){
            $this->response(
                array(
                    'status' => TRUE,
                    'message' => $this::DELETE_SUCCESS_MESSSAGE
                )
            );
        }else{
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::DELETE_FAILED_MESSAGE
                )
            );
        }
    }
}
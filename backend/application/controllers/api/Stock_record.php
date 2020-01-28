<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class Stock_record extends REST_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->model("stock_record_model");
        $this->load->model('user_model');
        $this->load->model('product_model');
    }

    public function index_post(){
        $broker = $this->post('broker');
        $order_item = $this->post('order_item');
        $order_date = $this->post('order_date');
        $order_number = $this->post('order_number');
        $quantity_in = $this->post('quantity_in');
        $quantity_out = $this->post('quantity_out');
        $order_status = $this->post('order_status');
        $seller = $this->post('seller');

        if(!isset($broker) || !isset($order_item) || !isset($order_date) || !isset($order_number) || 
        !isset($quantity_in) || !isset($quantity_out) || !isset($order_status) || !isset($seller)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE
                )
            );
            return;
        }

        if($this->user_model->is_not_exists($broker)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE
                )
            );
            return;
        };

        if($this->product_model->is_not_exists($order_item)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE
                )
            );
            return;
        };

        if($this->stock_record_model->insert_stock_record($broker, $order_item, $order_date, $order_number,
        $quantity_in, $quantity_out, $order_status, $seller)){
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

        if(isset($id)) $this->response($this->stock_record_model->get_stock_record_where($id));
        else $this->response($this->stock_record_model->get_all_stock_record());
    }

    public function index_put(){
        $id = $this->put('id');
        $broker = $this->put('broker');
        $order_item = $this->put('order_item');
        $order_date = $this->put('order_date');
        $order_number = $this->put('order_number');
        $quantity_in = $this->put('quantity_in');
        $quantity_out = $this->put('quantity_out');
        $order_status = $this->put('order_status');
        $seller = $this->put('seller');

        if(!isset($id) || !isset($broker) || !isset($order_item) || !isset($order_date) || !isset($order_number) || 
        !isset($quantity_in) || !isset($quantity_out) || !isset($order_status) || !isset($seller)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE
                )
            );
            return;
        }

        if($this->stock_record_model->is_not_exists($broker)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE
                )
            );
            return;
        }

        if($this->user_model->is_not_exists($broker)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE
                )
            );
            return;
        };

        if($this->product_model->is_not_exists($order_item)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE
                )
            );
            return;
        };
        
        if($this->stock_record_model->update_stock_record($id, $broker, $order_item, $order_date, $order_number,
        $quantity_in, $quantity_out, $order_status, $seller)){
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

        if($this->stock_record_model->is_not_exists($id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE
                )
            );
            return;
        }

        if($this->stock_record_model->delete_stock_record($id)){
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
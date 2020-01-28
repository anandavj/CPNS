<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class Order_status extends REST_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->model("order_status_model");
    }

    public function index_post(){
        $status = $this->post('status');

        if(!isset($status)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE
                )
            );
            return;
        }

        if($this->order_status_model->insert_order_status($status)){
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

        if(isset($id)) $this->response($this->order_status_model->get_order_status_where($id));
        else $this->response($this->order_status_model->get_all_order_status());
    }

    public function index_put(){
        $id = $this->put('id');
        $status = $this->put('status');

        if(!isset($id) || !isset($status)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE
                )
            );
            return;
        }

        if($this->order_status_model->is_not_exists($id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE
                )
            );
            return;
        }
        
        if($this->order_status_model->update_order_status($id, $status)){
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

        if($this->order_status_model->is_not_exists($id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE
                )
            );
            return;
        }

        if($this->order_status_model->delete_order_status($id)){
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
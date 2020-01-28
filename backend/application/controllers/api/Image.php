<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class Image extends REST_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->model("image_model");
        $this->load->model('product_model');
    }

    public function index_post(){
        $product_id = $this->post('productId');
        $image = $this->post('image');

        if(!isset($product_id) || !isset($image)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE
                )
            );
            return;
        }

        if($this->product_model->is_not_exists($product_id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE
                )
            );
            return;
        };

        if($this->image_model->insert_image($product_id, $image)){
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

        if(isset($id)) $this->response($this->image_model->get_image_where($id));
        else $this->response($this->image_model->get_all_image());
    }

    public function index_put(){
        $id = $this->put('id');
        $product_id = $this->put('productId');
        $image = $this->put('image');

        if(!isset($id) || !isset($product_id) || !isset($image)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE
                )
            );
            return;
        }

        if($this->product_model->is_not_exists($product_id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE
                )
            );
            return;
        };
        
        if($this->image_model->update_image($id, $product_id, $image)){
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

        if($this->image_model->is_not_exists($id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE
                )
            );
            return;
        }

        if($this->image_model->delete_image($id)){
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
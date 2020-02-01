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
            $required_parameters = [];
            if(!isset($product_id)) array_push($required_parameters, 'productId');
            if(!isset($image)) array_push($required_parameters, 'image');
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE.implode(', ', $required_parameters)
                ),REST_Controller::HTTP_BAD_REQUEST
            );
            return;
        }

        if($this->product_model->is_not_exists($product_id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE." productId does not exist"
                ),REST_Controller::HTTP_BAD_REQUEST
            );
            return;
        };

        if($this->image_model->insert_image($product_id, $image)){
            $this->response(
                array(
                    'status' => TRUE,
                    'message' => $this::INSERT_SUCCESS_MESSSAGE
                ),REST_Controller::HTTP_CREATED
            );
        }else{
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INSERT_FAILED_MESSAGE
                ),REST_Controller::HTTP_BAD_GATEWAY
            );
        }
    }

    public function index_get(){
        $id = $this->get('id');

        if(isset($id)) $this->response($this->image_model->get_image_where($id),REST_Controller::HTTP_OK);
        else $this->response($this->image_model->get_all_image(),REST_Controller::HTTP_OK);
    }

    public function index_put(){
        $id = $this->put('id');
        $product_id = $this->put('productId');
        $image = $this->put('image');

        if(!isset($id) || !isset($product_id) || !isset($image)){
            $required_parameters = [];
            if(!isset($id)) array_push($required_parameters, 'id');
            if(!isset($product_id)) array_push($required_parameters, 'productId');
            if(!isset($image)) array_push($required_parameters, 'image');
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE.implode(', ', $required_parameters)
                ),REST_Controller::HTTP_BAD_REQUEST
            );
            return;
        }

        if($this->product_model->is_not_exists($product_id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE." productId does not exist"
                ),REST_Controller::HTTP_BAD_REQUEST
            );
            return;
        };
        
        if($this->image_model->update_image($id, $product_id, $image)){
            $this->response(
                array(
                    'status' => TRUE,
                    'message' => $this::UPDATE_SUCCESS_MESSSAGE
                ),REST_Controller::HTTP_OK
            );
        }else{
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::UPDATE_FAILED_MESSAGE
                ),REST_Controller::HTTP_BAD_GATEWAY
            );
        }
    }

    public function index_delete(){
        $id = $this->delete('id');

        if(!isset($id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE."id"
                ),REST_Controller::HTTP_BAD_REQUEST
            );
            return;
        }

        if($this->image_model->is_not_exists($id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE." id does not exist"
                ),REST_Controller::HTTP_BAD_REQUEST
            );
            return;
        }

        if($this->image_model->delete_image($id)){
            $this->response(
                array(
                    'status' => TRUE,
                    'message' => $this::DELETE_SUCCESS_MESSSAGE
                ),REST_Controller::HTTP_OK
            );
        }else{
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::DELETE_FAILED_MESSAGE
                ),REST_Controller::HTTP_BAD_GATEWAY
            );
        }
    }
}
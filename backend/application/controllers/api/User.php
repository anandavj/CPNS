<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class User extends REST_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->model('user_model');
        $this->load->model('user_task_group_model');
    }

    public function index_post(){
        $user_task_group_id = $this->post(Schema::USER_TASK_GROUP_ID); 
        $name = $this->post('name'); 
        $telephone = $this->post('telephone'); 
        $address = $this->post('address'); 
        $uid = $this->post('uid');

        if(!isset($user_task_group_id) || !isset($name) || !isset($telephone) || !isset($address) || !isset($uid)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE
                )
            );
            return;
        }

        if($this->user_task_group_model->is_not_exists($user_task_group_id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE
                )
            );
            return;
        }

        if($this->user_model->insert_user($user_task_group_id, $name, $telephone, $address, $uid)){
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

        if(isset($id)) $this->response($this->user_model->get_user_where($id));
        else $this->response($this->user_model->get_all_user());
    }

    public function index_put(){
        $id = $this->put('id');
        $user_task_group_id = $this->put(Schema::USER_TASK_GROUP_ID); 
        $name = $this->put('name'); 
        $telephone = $this->put('telephone'); 
        $address = $this->put('address'); 
        $uid = $this->put('uid');

        if(!isset($id) || !isset($user_task_group_id) || !isset($name) || !isset($telephone) || !isset($address) || !isset($uid)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE
                )
            );
            return;
        }

        if($this->user_model->is_not_exists($id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE
                )
            );
            return;
        }

        if($this->user_task_group_model->is_not_exists($user_task_group_id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE
                )
            );
            return;
        }

        if($this->user_model->update_user($id, $user_task_group_id, $name, $telephone, $address, $uid)){
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

        if($this->user_model->is_not_exists($id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE
                )
            );
            return;
        }

        if($this->user_model->delete_user($id)){
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
<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class Cpns extends REST_Controller {

    const INSERT_SUCCESS_MESSSAGE = 'Insert success.';
    const INSERT_FAILED_MESSAGE = 'Insert success.';
    const UPDATE_SUCCESS_MESSSAGE = 'Update success.';
    const UPDATE_FAILED_MESSAGE = 'Update success.';
    const DELETE_SUCCESS_MESSSAGE = 'Delete success.';
    const DELETE_FAILED_MESSAGE = 'Delete success.';
    const ID_ALREADY_EXISTS_MESSAGE = 'Id already exists.';
    const INVALID_ID_MESSAGE = 'Invalid Id.';
    const REQUIRED_PARAMETER_MESSAGE = 'Required parameter is not specified.';
    
    public function __construct(){
        parent::__construct();

        $this->load->model("tasks_model");
        $this->load->model("user_task_groups_model");
        $this->load->model("users_model");

        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
        $method = $_SERVER['REQUEST_METHOD'];
        if($method == "OPTIONS") {
            die();
        }
    }

    //TASKS
    public function index_get(){
        echo 'API CPNS Buana Paksa';
    }

    public function tasks_post(){
        $action = $this->post('action');

        if(!isset($action)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => Cpns::REQUIRED_PARAMETER_MESSAGE
                )
            );
            return;
        }

        if($this->tasks_model->insert_task($action)){
            $this->response(
                array(
                    'status' => TRUE,
                    'message' => Cpns::INSERT_SUCCESS_MESSSAGE
                )
            );
        }else{
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => Cpns::REQUIRED_PARAMETER_MESSAGE
                )
            );
        }
    }

    public function tasks_get(){
        $id = $this->get('id');

        if(isset($id)) $this->response($this->tasks_model->get_task_where($id));
        else $this->response($this->tasks_model->get_all_tasks());
    }

    public function tasks_put(){
        $id = $this->put('id');
        $action = $this->put('action');

        if(!isset($id) || !isset($action)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => Cpns::REQUIRED_PARAMETER_MESSAGE
                )
            );
            return;
        }

        if($this->tasks_model->is_not_exists($id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => Cpns::INVALID_ID_MESSAGE
                )
            );
            return;
        }

        if($this->tasks_model->update_task($id, $action)){
            $this->response(
                array(
                    'status' => TRUE,
                    'message' => Cpns::UPDATE_SUCCESS_MESSSAGE
                )
            );
        }else{
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => Cpns::UPDATE_FAILED_MESSAGE
                )
            );
        }
    }

    public function tasks_delete(){
        $id = $this->delete('id');

        if(!isset($id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => Cpns::REQUIRED_PARAMETER_MESSAGE
                )
            );
            return;
        }

        if($this->tasks_model->is_not_exists($id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => Cpns::INVALID_ID_MESSAGE
                )
            );
            return;
        }

        if($this->tasks_model->delete_task($id)){
            $this->response(
                array(
                    'status' => TRUE,
                    'message' => Cpns::DELETE_SUCCESS_MESSSAGE
                )
            );
        }else{
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => Cpns::DELETE_FAILED_MESSAGE
                )
            );
        }
    }

    //USER TASK GROUPS
    public function user_task_groups_post(){
        $name = $this->post('name');

        if(!isset($name)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => Cpns::REQUIRED_PARAMETER_MESSAGE
                )
            );
            return;
        }

        if($this->user_task_groups_model->insert_user_task_groups($name)){
            $this->response(
                array(
                    'status' => TRUE,
                    'message' => Cpns::INSERT_SUCCESS_MESSSAGE
                )
            );
        }else{
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => Cpns::REQUIRED_PARAMETER_MESSAGE
                )
            );
        }
    }

    public function user_task_groups_get(){
        $id = $this->get('id');

        if(isset($id)) $this->response($this->user_task_groups_model->get_user_task_groups_where($id));
        else $this->response($this->user_task_groups_model->get_all_user_task_groups());
    }

    public function user_task_groups_put(){
        $id = $this->put('id');
        $name = $this->put('name');

        if(!isset($id) || !isset($name)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => Cpns::REQUIRED_PARAMETER_MESSAGE
                )
            );
            return;
        }

        if($this->user_task_groups_model->is_not_exists($id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => Cpns::INVALID_ID_MESSAGE
                )
            );
            return;
        }

        if($this->user_task_groups_model->update_user_task_groups($id, $name)){
            $this->response(
                array(
                    'status' => TRUE,
                    'message' => Cpns::UPDATE_SUCCESS_MESSSAGE
                )
            );
        }else{
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => Cpns::UPDATE_FAILED_MESSAGE
                )
            );
        }
    }

    public function user_task_groups_delete(){
        $id = $this->delete('id');

        if(!isset($id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => Cpns::REQUIRED_PARAMETER_MESSAGE
                )
            );
            return;
        }

        if($this->user_task_groups_model->is_not_exists($id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => Cpns::INVALID_ID_MESSAGE
                )
            );
            return;
        }

        if($this->user_task_groups_model->delete_user_task_groups($id)){
            $this->response(
                array(
                    'status' => TRUE,
                    'message' => Cpns::DELETE_SUCCESS_MESSSAGE
                )
            );
        }else{
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => Cpns::DELETE_FAILED_MESSAGE
                )
            );
        }
    }

    //USERS
    
}
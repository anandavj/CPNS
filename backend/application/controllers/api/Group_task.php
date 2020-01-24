<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class Group_task extends REST_Controller {

    public function __construct(){
        parent::__construct();
        $this->load->model('group_task_model');
        $this->load->model('user_task_group_model');
        $this->load->model('task_model');
    }

    public function index_post(){
        $user_task_group_id = $this->post('userTaskGroupId');
        $task_id = $this->post('taskId');

        if(!isset($user_task_group_id) || !isset($user_task_group_id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE
                )
            );
            return;
        }

        if($this->user_task_groups_model->is_not_exists($user_task_group_id) ||
        $this->task_model->is_not_exists($task_id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE
                )
            );
            return;
        }

        if($this->group_task_model->insert_group_task($user_task_group_id, $task_id)){
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

        if(isset($id)) $this->response($this->group_task_model->get_group_task_where($id));
        else $this->response($this->group_task_model->get_all_group_task());
    }

    public function index_put(){
        $id = $this->put('id');
        $user_task_group_id = $this->put('userTaskGroupId');
        $task_id = $this->put('taskId');

        if(!isset($id) || !isset($user_task_group_id) || !isset($task_id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE
                )
            );
            return;
        }

        if($this->group_task_model->is_not_exists($id) || 
        $this->user_task_groups_model->is_not_exists($user_task_group_id) ||
        $this->task_model->is_not_exists($task_id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE
                )
            );
            return;
        }

        if($this->group_task_model->update_group_task($id, $user_task_group_id, $task_id)){
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

        if($this->group_task_model->is_not_exists($id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE
                )
            );
            return;
        }

        if($this->group_task_model->delete_user_task_groups($id)){
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
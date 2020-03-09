<?php

defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;
use Kreait\Firebase\Factory;

class User extends REST_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('user_model');
        $this->load->model('user_task_group_model');
        $this->load->model('user_task_model');
        $this->load->model('group_task_model');
    }

    public function index_post()
    {
        $user_task_group_id = $this->post(Schema::USER_TASK_GROUP_ID);
        $name = $this->post('name');
        $place_of_birth = $this->post('placeOfBirth');
        $date_of_birth = $this->post('dateOfBirth');
        $religion = $this->post('religion');
        $status = $this->post('status');
        $telephone = $this->post('telephone');
        $address = $this->post('address');
        $taskId = $this->post('taskId');
        $uid = $this->post('uid');

        if (!isset($user_task_group_id) || !isset($name) || !isset($telephone) || !isset($address) || !isset($uid) || 
        !isset($place_of_birth) || !isset($date_of_birth) || !isset($religion) || !isset($status) || !isset($taskId)) {
            $required_parameters = [];
            if (!isset($user_task_group_id)) array_push($required_parameters, 'userTaskGroupId');
            if (!isset($name)) array_push($required_parameters, 'name');
            if (!isset($place_of_birth)) array_push($required_parameters, 'placeOfBirth');
            if (!isset($date_of_birth)) array_push($required_parameters, 'dateOfBirth');
            if (!isset($religion)) array_push($required_parameters, 'religion');
            if (!isset($status)) array_push($required_parameters, 'status');
            if (!isset($telephone)) array_push($required_parameters, 'telephone');
            if (!isset($address)) array_push($required_parameters, 'address');
            if (!isset($taskId)) array_push($required_parameters, 'taskId');
            if (!isset($uid)) array_push($required_parameters, 'uid');
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE . implode(', ', $required_parameters)
                ),
                REST_Controller::HTTP_BAD_REQUEST
            );
            return;
        }

        if ($this->user_task_group_model->is_not_exists($user_task_group_id)) {
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE . " userTaskGroupId does not exist"
                ),
                REST_Controller::HTTP_BAD_REQUEST
            );
            return;
        }


        if ($this->user_model->insert_user($user_task_group_id, $name, $place_of_birth, $date_of_birth, 
        $religion, $status, $telephone, $address, $uid)) {
            $insert_id = $this->db->insert_id();
            // $tasks = $this->group_task_model->get_group_task_where($user_task_group_id);
            // $user_task = [];
            // foreach ($tasks['task'] as $task) {
            //     array_push($user_task, $task['taskId']);
            // }

            if ($this->user_task_model->insert_user_task($insert_id, $taskId)) {
                $this->response(
                    array(
                        'status' => TRUE,
                        'message' => $this::INSERT_SUCCESS_MESSSAGE,
                        // 'id' => $insert_id
                    ),
                    REST_Controller::HTTP_CREATED
                );
            } else {
                $this->user_model->delete_user($insert_id);
                $this->response(
                    array(
                        'status' => FALSE,
                        'message' => $this::INSERT_FAILED_MESSAGE . " Details: create user task failed"
                    ),
                    REST_Controller::HTTP_INTERNAL_SERVER_ERROR
                );
            }

        } else {
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INSERT_FAILED_MESSAGE . " Details: create user failed"
                ),
                REST_Controller::HTTP_INTERNAL_SERVER_ERROR
            );
        }
        return;
    }

    public function index_get()
    {

        // $factory = (new Factory)->withDatabaseUri('https://test-7a393.firebaseio.com')->createAuth();
        $id = $this->get('id');

        if (isset($id)){
            $result = $this->user_model->get_user_where($id);
            $user_task = $this->user_task_model->get_user_task_where($id);
            $result = array_merge($result[0], array('taskId' => $user_task));

            $this->response($result, REST_Controller::HTTP_OK);
        }
        
        else {
            $index = 0;
            $result = $this->user_model->get_all_user();
            foreach($result as $row){
                $user_task = $this->user_task_model->get_user_task_where($row['id']);
                $result[$index] = array_merge($result[$index], array('taskId' => $user_task));
                $index++;
            }
        }
            $this->response($result, REST_Controller::HTTP_OK);
    }

    public function index_put()
    {
        $id = $this->put('id');
        $user_task_group_id = $this->put('userTaskGroupId');
        $name = $this->put('name');
        $phone = $this->put('phone');
        $address = $this->put('address');
        $place_of_birth = $this->put('placeOfBirth');
        $religion = $this->put('religion');
        $status = $this->put('status');
        $tasks = $this->put('taskId');

        if (!isset($id)) {
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE . "id"
                ),
                REST_Controller::HTTP_BAD_REQUEST
            );
            return;
        }
        if ($this->user_model->is_not_exists($id)) {
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE . " id does not exist"
                ),
                REST_Controller::HTTP_BAD_REQUEST
            );
            return;
        }

        $datas = array();
        $update_user_task = 0;
        if (isset($user_task_group_id)) {
            if ($this->user_task_group_model->is_not_exists($user_task_group_id)) {
                $this->response(
                    array(
                        'status' => FALSE,
                        'message' => $this::INVALID_ID_MESSAGE . " userTaskGroupId does not exist"
                    ),
                    REST_Controller::HTTP_BAD_REQUEST
                );
                return;
            } else if ($this->db->query("SELECT * FROM user WHERE id ='{$id}' AND user_task_group_id='{$user_task_group_id}'")->num_rows() == 0) {
                $datas = array_merge($datas, array('user_task_group_id' => $user_task_group_id));
                $update_user_task = 1;
            }
        }
        if (isset($name)) {
            $datas = array_merge($datas, array('name' => $name));
        }
        if (isset($phone)) {
            $datas = array_merge($datas, array('telephone' => $phone));
        }
        if (isset($address)) {
            $datas = array_merge($datas, array('address' => $address));
        }
        if (isset($place_of_birth)) {
            $datas = array_merge($datas, array('place_of_birth' => $place_of_birth));
        }
        if (isset($religion)) {
            $datas = array_merge($datas, array('religion' => $religion));
        }
        if (isset($status)) {
            $datas = array_merge($datas, array('status' => $status ));
        }
        
        if ($this->user_model->update_user($id, $datas)) {
            if ($update_user_task) {
                $result = $this->group_task_model->get_group_task_where($user_task_group_id);
                $tasks = [];
                foreach ($result as $row) {
                    array_push($tasks, $row['task_id']);
                }
                // $this->response($tasks);
                // return;
                

            }

            if(isset($tasks)){
                if (!$this->user_task_model->update_user_task($id, $tasks)){
                    $this->response(
                        array(
                            'status' => FALSE,
                            'message' => $this::UPDATE_FAILED_MESSAGE." Failed to update user_task"
                        ),
                        REST_Controller::HTTP_BAD_REQUEST
                    );
                    return;
                }
      
            }

            $this->response(
                array(
                    'status' => TRUE,
                    'message' => $this::UPDATE_SUCCESS_MESSSAGE
                ),
                REST_Controller::HTTP_OK
            );
        } else {
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::UPDATE_FAILED_MESSAGE
                ),
                REST_Controller::HTTP_INTERNAL_SERVER_ERROR
            );
        }
    }

    public function index_delete()
    {
        $id = $this->input->get('id');

        if (!isset($id)) {
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE . "id"
                ),
                REST_Controller::HTTP_BAD_REQUEST
            );
            return;
        }

        if ($this->user_model->is_not_exists($id)) {
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE . " id does not exist"
                ),
                REST_Controller::HTTP_BAD_REQUEST
            );
            return;
        }

        if ($this->user_model->delete_user($id)) {
            $this->response(
                array(
                    'status' => TRUE,
                    'message' => $this::DELETE_SUCCESS_MESSSAGE
                ),
                REST_Controller::HTTP_OK
            );
        } else {
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::DELETE_FAILED_MESSAGE
                ),
                REST_Controller::HTTP_INTERNAL_SERVER_ERROR
            );
        }
    }
}

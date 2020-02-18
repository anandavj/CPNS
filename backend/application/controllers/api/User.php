<?php

defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

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
        $phone = $this->post('phone');
        $address = $this->post('address');
        $uid = $this->post('uid');

        if (!isset($user_task_group_id) || !isset($name) || !isset($phone) || !isset($address) || !isset($uid) || 
        !isset($place_of_birth) || !isset($date_of_birth) || !isset($religion) || !isset($status)) {
            $required_parameters = [];
            if (!isset($user_task_group_id)) array_push($required_parameters, 'userTaskGroupId');
            if (!isset($name)) array_push($required_parameters, 'name');
            if (!isset($uid)) array_push($required_parameters, 'placeOfBirth');
            if (!isset($uid)) array_push($required_parameters, 'dateOfBirth');
            if (!isset($uid)) array_push($required_parameters, 'religion');
            if (!isset($uid)) array_push($required_parameters, 'status');
            if (!isset($phone)) array_push($required_parameters, 'phone');
            if (!isset($address)) array_push($required_parameters, 'address');
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


        if ($insert_id = $this->user_model->insert_user($user_task_group_id, $name, $phone, $address, $uid)) {
            $tasks = $this->group_task_model->get_group_task_where($user_task_group_id);
            $user_task = [];
            foreach ($tasks as $task) {
                array_push($user_task, $task['task_id']);
            }

            if ($this->user_task_model->insert_user_task($insert_id, $user_task)) {
                $this->response(
                    array(
                        'status' => TRUE,
                        'message' => $this::INSERT_SUCCESS_MESSSAGE,
                        'id' => $insert_id
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
                    REST_Controller::HTTP_BAD_GATEWAY
                );
            }

        } else {
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INSERT_FAILED_MESSAGE . " Details: create user failed"
                ),
                REST_Controller::HTTP_BAD_GATEWAY
            );
        }
        return;
    }

    public function index_get()
    {
        $id = $this->get('id');

        if (isset($id)) $this->response($this->user_model->get_user_where($id), REST_Controller::HTTP_OK);
        else $this->response($this->user_model->get_all_user(), REST_Controller::HTTP_OK);
    }

    public function index_put()
    {
        $id = $this->put('id');
        $user_task_group_id = $this->put('userTaskGroupId');
        $name = $this->put('name');
        $phone = $this->put('phone');
        $address = $this->put('address');


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

        if ($this->user_model->update_user($id, $datas)) {
            if ($update_user_task) {
                $result = $this->group_task_model->get_group_task_where($user_task_group_id);
                $tasks = [];
                foreach ($result as $row) {
                    array_push($tasks, $row['task_id']);
                }
                // $this->response($tasks);
                // return;

                if (!$this->user_task_model->update_user_task($id, $tasks)) {
                    $this->response(
                        array(
                            'status' => FALSE,
                            'message' => $this::UPDATE_FAILED_MESSAGE . " Details: user_task_group_id updated but failed on update user_task"
                        ),
                        REST_Controller::HTTP_BAD_GATEWAY
                    );
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
                REST_Controller::HTTP_BAD_GATEWAY
            );
        }
    }

    public function index_delete()
    {
        $id = $this->delete('id');

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
                REST_Controller::HTTP_BAD_GATEWAY
            );
        }
    }
}

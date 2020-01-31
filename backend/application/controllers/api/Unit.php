<?php

defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class Unit extends REST_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model("unit_model");
    }

    public function index_post()
    {
        $name = $this->post('name');
        $abbreviation = $this->post('abbreviation');
        $description = $this->post('description');

        if (!isset($name) || !isset($abbreviation)) {
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE
                )
            );
            return;
        }

        if ($this->unit_model->insert_unit($name, $abbreviation, $description)) {
            $this->response(
                array(
                    'status' => TRUE,
                    'message' => $this::INSERT_SUCCESS_MESSSAGE
                )
            );
        } else {
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE
                )
            );
        }
    }

    public function index_get()
    {
        $id = $this->get('id');

        if (isset($id)) $this->response($this->unit_model->get_unit_where($id));
        else $this->response($this->unit_model->get_all_unit());
    }

    public function index_put()
    {
        $id = $this->put('id');
        $name = $this->put('name');
        $abbreviation = $this->put('abbreviation');
        $description = $this->put('description');

        if (!isset($id) || !isset($abbreviation)) {
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE
                )
            );
            return;
        }

        if ($this->unit_model->is_not_exists($id)) {
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE
                )
            );
            return;
        }

        if ($this->unit_model->update_unit($id, $name, $abbreviation, $description)) {
            $this->response(
                array(
                    'status' => TRUE,
                    'message' => $this::UPDATE_SUCCESS_MESSSAGE
                )
            );
        } else {
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::UPDATE_FAILED_MESSAGE
                )
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
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE
                )
            );
            return;
        }

        if ($this->unit_model->is_not_exists($id)) {
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE
                )
            );
            return;
        }

        if ($this->unit_model->delete_unit($id)) {
            $this->response(
                array(
                    'status' => TRUE,
                    'message' => $this::DELETE_SUCCESS_MESSSAGE
                )
            );
        } else {
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::DELETE_FAILED_MESSAGE
                )
            );
        }
    }
}

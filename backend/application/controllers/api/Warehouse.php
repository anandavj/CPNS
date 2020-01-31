<?php

defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class warehouse extends REST_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('warehouse_model');
    }

    public function index_post()
    {
        $name = $this->post('name');
        $address = $this->post('address');

        if (!isset($name) || !isset($address)) {
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE
                )
            );
            return;
        }

        // if ($this->warehouse_model->!is_not_exists($id)) {
        //     $this->response(
        //         array(
        //             'status' => FALSE,
        //             'message' => $this::INVALID_ID_MESSAGE
        //         )
        //     );
        //     return;
        // }

        if ($this->warehouse_model->insert_warehouse($name, $address)) {
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

        if (isset($id)) $this->response($this->warehouse_model->get_warehouse_where($id));
        else $this->response($this->warehouse_model->get_all_warehouse());
    }

    public function index_put()
    {
        $id = $this->put('id');
        $name = $this->put('name');
        $address = $this->put('address');

        if (!isset($id) || !isset($name) || !isset($address)) {
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE
                )
            );
            return;
        }

        if ($this->warehouse_model->is_not_exists($id)) {
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE
                )
            );
            return;
        }

        if ($this->warehouse_model->is_not_exists($id)) {
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE
                )
            );
            return;
        }

        if ($this->warehouse_model->update_warehouse($id, $name, $address)) {
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

        if ($this->warehouse_model->is_not_exists($id)) {
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE
                )
            );
            return;
        }

        if ($this->warehouse_model->delete_warehouse($id)) {
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

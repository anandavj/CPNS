<?php

defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class Surat_jalan extends REST_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model("surat_jalan_model");
    }

    public function index_post()
    {
        $name = $this->post('name');
        $receiver_name = $this->post('receiverName');
        $reference_number = $this->post('referenceNumber');
        $date = $this->post('date');
        $address = $this->post('address');
        $items = $this->post('items');
        $description = $this->post('description');

        if (!isset($name) || !isset($receiver_name) || !isset($reference_number) || !isset($date) || !isset($address) || !isset($items) || !isset($description)) {
            $required_parameters = [];
            if (!isset($name)) array_push($required_parameters, 'name');
            if (!isset($receiver_name)) array_push($required_parameters, 'receiverName');
            if (!isset($reference_number)) array_push($required_parameters, 'referenceNumber');
            if (!isset($date)) array_push($required_parameters, 'date');
            if (!isset($address)) array_push($required_parameters, 'address');
            if (!isset($description)) array_push($required_parameters, 'description');
            if (!isset($items)) array_push($required_parameters, 'items');
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE . implode(', ', $required_parameters)
                ),
                REST_Controller::HTTP_BAD_REQUEST
            );
            return;
        }

        if ($this->surat_jalan_model->insert_surat_jalan($name, $receiver_name, $reference_number, $date, $address, $items, $description)) {
            $this->response(
                array(
                    'status' => TRUE,
                    'message' => $this::INSERT_SUCCESS_MESSSAGE
                ),
                REST_Controller::HTTP_OK
            );
        } else {
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INSERT_FAILED_MESSAGE
                ),
                REST_Controller::HTTP_INTERNAL_SERVER_ERROR
            );
        }
    }

    public function index_get()
    {
        $id = $this->get('id');

        if (isset($id)) $this->response($this->surat_jalan_model->get_surat_jalan_where($id), REST_Controller::HTTP_OK);
        else $this->response($this->surat_jalan_model->get_all_surat_jalan(), REST_Controller::HTTP_OK);
    }

    public function index_put()
    {
        $id = $this->post('id');
        $name = $this->post('name');
        $receiver_name = $this->post('receiverName');
        $reference_number = $this->post('referenceNumber');
        $date = $this->post('date');
        $address = $this->post('address');
        $items = $this->post('items');
        $description = $this->post('description');

        if (!isset($name) || !isset($receiver_name) || !isset($reference_number) || !isset($date) || !isset($address) || !isset($items) || !isset($description)) {
            $required_parameters = [];
            if (!isset($name)) array_push($required_parameters, 'name');
            if (!isset($receiver_name)) array_push($required_parameters, 'receiverName');
            if (!isset($reference_number)) array_push($required_parameters, 'referenceNumber');
            if (!isset($date)) array_push($required_parameters, 'date');
            if (!isset($address)) array_push($required_parameters, 'address');
            if (!isset($description)) array_push($required_parameters, 'description');
            if (!isset($items)) array_push($required_parameters, 'items');
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE . implode(', ', $required_parameters)
                ),
                REST_Controller::HTTP_BAD_REQUEST
            );
            return;
        }

        if ($this->surat_jalan_model->is_not_exists($id)) {
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE . " id does not exist"
                ),
                REST_Controller::HTTP_BAD_REQUEST
            );
            return;
        }

        if ($this->surat_jalan_model->update_surat_jalan($id, $name, $receiver_name, $reference_number, $date, $address, $items, $description)) {
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
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE . " id"
                ),
                REST_Controller::HTTP_BAD_REQUEST
            );
            return;
        }

        if ($this->surat_jalan_model->is_not_exists($id)) {
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE . " id does not exist"
                ),
                REST_Controller::HTTP_BAD_REQUEST
            );
            return;
        }

        if ($this->surat_jalan_model->delete_surat_jalan($id)) {
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

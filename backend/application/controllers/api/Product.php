<?php

defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class Product extends REST_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('product_model');
        $this->load->model('category_model');
        $this->load->model('unit_model');
        $this->load->model('product_tag_model');
        $this->load->model('product_image_model');
    }

    public function index_post()
    {
        $name = $this->post('name');
        $category_id = $this->post('categoryId');
        $specification = $this->post('specification');
        $description = $this->post('description');
        $stock = $this->post('stock');
        $unit_id = $this->post('unitId');
        $open_price = $this->post('openPrice');
        $bottom_price = $this->post('bottomPrice');
        $tags = $this->post('tags');
        $images = $this->post('images');

        if (
            !isset($name) || !isset($category_id) || !isset($specification) || !isset($unit_id) || !isset($open_price) || !isset($bottom_price) || !isset($tags) || !isset($images)
        ) {
            $required_parameters = [];
            if (!isset($name)) array_push($required_parameters, 'name');
            if (!isset($category_id)) array_push($required_parameters, 'categoryId');
            if (!isset($specification)) array_push($required_parameters, 'specification');
            if (!isset($unit_id)) array_push($required_parameters, 'unitId');
            if (!isset($open_price)) array_push($required_parameters, 'openPrice');
            if (!isset($bottom_price)) array_push($required_parameters, 'bottomPrice');
            if (!isset($tags)) array_push($required_parameters, 'tags');
            if (!isset($images)) array_push($required_parameters, 'images');
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE . implode(', ', $required_parameters)
                ),
                REST_Controller::HTTP_BAD_REQUEST
            );
            return;
        }

        if ($this->category_model->is_not_exists($category_id)) {
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE . ' categoryId does not exist'
                ),
                REST_Controller::HTTP_BAD_REQUEST
            );
            return;
        }

        if ($this->unit_model->is_not_exists($unit_id)) {
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE . ' unitId does not exist'
                ),
                REST_Controller::HTTP_BAD_REQUEST
            );
            return;
        }

        if ($product_id = $this->product_model->insert_product($name, $category_id, $specification, $description, $stock, $unit_id, $open_price, $bottom_price)) {
            if(!$this->product_tag_model->insert_product_tag($product_id, $tags)){
                $this->response(
                    array(
                        'status' => FALSE,
                        'message' => $this::INSERT_FAILED_MESSAGE." failed to insert product tag"
                    ),REST_Controller::HTTP_INTERNAL_SERVER_ERROR
                );
                return;
            }

            if(!$this->product_image_model->insert_product_image($product_id, $images)){
                $this->response(
                    array(
                        'status' => FALSE,
                        'message' => $this::INSERT_FAILED_MESSAGE." failed to insert image tag"
                    ),REST_Controller::HTTP_INTERNAL_SERVER_ERROR
                );
                return;    
            }
            
            $this->response(
                array(
                    'status' => TRUE,
                    'message' => $this::INSERT_SUCCESS_MESSSAGE
                ),
                REST_Controller::HTTP_CREATED,
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
        if (isset($id)) $this->response($this->product_model->get_product_where($id),REST_Controller::HTTP_OK);
        else $this->response($this->product_model->get_all_product(),REST_Controller::HTTP_OK);
    }

    public function index_put()
    {
        $id = $this->put('id');
        $name = $this->put('name');
        $category_id = $this->put('categoryId');
        $description = $this->put('description');
        $specification = $this->put('specification');
        $stock = $this->put('stock');
        $unit_id = $this->put('unitId');
        $open_price = $this->put('openPrice');
        $bottom_price = $this->put('bottomPrice');
        $tags = $this->put('tags');
        $images = $this->put('images');

        $datas = array();
        
        if(!isset($id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE." id"
                ),
                REST_Controller::HTTP_BAD_REQUEST
            );
            return;
        }
        if($this->product_model->is_not_exists($id)){
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE. " id does not exist"
                ),
                REST_Controller::HTTP_BAD_REQUEST
            );
            return;
        }
        
        $datas = array_merge($datas, array('id' => $id));

        if(isset($category_id)){
            if($this->category_model->is_not_exists($category_id)){
                $this->response(
                    array(
                        'status' => FALSE,
                        'message' => $this::INVALID_ID_MESSAGE." categoryId does not exist"
                    ),REST_Controller::HTTP_BAD_REQUEST
                );
                return;
            } else if($this->db->query("SELECT * FROM product WHERE id={$id} AND category_id={$category_id}")->num_rows() == 0){
                $datas = array_merge($datas, array('category_id' => $category_id));
            }
        }

        if(isset($unit_id)){
            if($this->unit_model->is_not_exists($unit_id)){
                $this->response(
                    array(
                        'status' => FALSE,
                        'message' => $this::INVALID_ID_MESSAGE." unitId does not exist"
                    ),REST_Controller::HTTP_BAD_REQUEST
                );
                return;
            } else if($this->db->query("SELECT * FROM product WHERE id={$id} AND unit_id={$unit_id}")->num_rows() == 0){
                $datas = array_merge($datas, array('unit_id' => $unit_id));
            }
        }

        if(!isset($description)){
            $description = "";
        }
        $datas = array_merge($datas, array('description' => $description));

        if(isset($specification)){
            $datas = array_merge($datas, array('specification' => $specification));
        }

        if(isset($stock)){
            $datas = array_merge($datas, array('stock' => $stock));
        }
        if(isset($open_price)){
            $datas = array_merge($datas, array('open_price' => $open_price));
        }
        if(isset($bottom_price)){
            $datas = array_merge($datas, array('bottom_price' => $bottom_price));
        }
        if(isset($name)){
            $datas = array_merge($datas, array('name' => $name));
        }

    
        if ($this->product_model->update_product($id, $datas)) {
            if(!$this->product_tag_model->update_product_tag($id,$tags)){
                $this->response(
                    array(
                        'status' => FALSE,
                        'message' => $this::UPDATE_FAILED_MESSAGE. " failed to update product tag"
                    ),REST_Controller::HTTP_INTERNAL_SERVER_ERROR
                );
                return;
            }

            if(!$this->product_image_model->update_product_image($id, $images)){
                $this->response(
                    array(
                        'status' => FALSE,
                        'message' => $this::UPDATE_FAILED_MESSAGE. " failed to update image tag"
                    ),REST_Controller::HTTP_INTERNAL_SERVER_ERROR
                );
                return;
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
                REST_Controller::HTTP_BAD_REQUEST
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
                    'message' => $this::REQUIRED_PARAMETER_MESSAGE. "id"
                ),
                REST_Controller::HTTP_BAD_REQUEST
            );
            return;
        }

        if ($this->product_model->is_not_exists($id)) {
            $this->response(
                array(
                    'status' => FALSE,
                    'message' => $this::INVALID_ID_MESSAGE . " id does not exist"
                ),
                REST_Controller::HTTP_BAD_REQUEST
            );
            return;
        }

        if ($this->product_model->delete_product($id)) {
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

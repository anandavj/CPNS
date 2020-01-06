<?php

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';

use Restserver\Libraries\REST_Controller;

class Walet extends REST_Controller {

    function __construct(){
        parent::__construct();
        $this->load->model("Users_model");
        $this->load->model("Barang_model");
        $this->load->model("Penjual_model");
        $this->load->model("Transaksi_model");
        $this->load->model('Dashboard_model');
        
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
        $method = $_SERVER['REQUEST_METHOD'];
        if($method == "OPTIONS") {
        die();
        }
    }

    public function index_get(){}

    public function users_post(){
        if($this->Users_model->login()['status']){
            $this->response($this->Users_model->login());
        }else{
            $this->response(['status' => FALSE]);
        }
    }

    //Barang
    public function barang_get(){
        if($this->get('userid')){
            $this->response($this->Barang_model->get_all_barang_by_userid($this->get('userid')));
        }else{
            $this->response(array('status' => FALSE, 'message' => 'invalid userid'));
        }
    }

    public function barang_post(){
        $this->response(['status' => $this->Barang_model->insert($this->post())]);
    }

    public function barang_put(){
        $this->response(['status' => $this->Barang_model->update($this->put())]);
    }

    public function barang_delete(){
        $this->response(['status' => $this->Barang_model->delete($this->delete('id'))]);
    }

    //Penjual
    public function penjual_get(){
        if($this->get('userid')){
            $this->response($this->Penjual_model->get_all_penjual_by_userid($this->get('userid')));
        }else{
            $this->response(array('status' => FALSE, 'message' => 'invalid userid'));
        }
    }

    public function penjual_post(){
        $this->response(['status' => $this->Penjual_model->insert($this->post())]);
    }

    public function penjual_put(){
        $this->response(['status' => $this->Penjual_model->update($this->put())]);
    }

    public function penjual_delete(){
        $this->response(['status' => $this->Penjual_model->delete($this->delete('id'))]);
    }

    //Transaksi
    public function transaksi_get(){
        if($this->get('userid')){
            $this->response($this->Transaksi_model->get_all_transaksi_by_userid($this->get('userid')));
        }else{
            $this->response(array('status' => FALSE, 'message' => 'invalid userid'));
        }
    }

    public function transaksi_post(){
        $this->response(['status' => $this->Transaksi_model->insert($this->post())]);
    }

    public function transaksi_put(){
        $this->response(['status' => $this->Transaksi_model->update($this->put())]);
    }

    public function transaksi_delete(){
        $this->response(['status' => $this->Transaksi_model->delete($this->delete('id'))]);
    }

    //dashboard
    public function dashboard_get(){
        $this->response($this->Dashboard_model->get_all_transaksi_per_month($this->get('userid')));
    }
}

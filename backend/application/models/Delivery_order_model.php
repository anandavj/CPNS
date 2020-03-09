<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Delivery_order_model extends CI_Model{

    private const TABLE_NAME = 'delivery_order';
    public function insert_delivery_order($name, $receiver_name, $date, $reference_number, $address, $description, $status, $type){
        $this->db->insert($this::TABLE_NAME, array(
            'name' => $name,
            'receiver_name' => $receiver_name,
            'date' => $date,
            'reference_number' => $reference_number,
            'address' => $address,
            'description' => $description,
            'status' => $status,
            'type' => $type,
        ));
        
        return $this->db->insert_id();
    }

    public function get_all_delivery_order(){
        return $this->db->get($this::TABLE_NAME)->result_array();
    }

    public function get_delivery_order_where($id){
        return $this->db->get_where($this::TABLE_NAME, "id='{$id}'")->result_array();
    }

    public function is_not_exists($id){
        if($this->db->get_where($this::TABLE_NAME, "id='{$id}'")->num_rows() == 0) return true;
        else return false;
    }

    public function update_delivery_order($id, $name, $receiver_name, $date, $reference_number, $address, $description, $status, $type){
        // Check apakah tidak merubah apa-apa?
        // kenapa perlu? karena jika update tidak ada perubahan affected_rows() return 0
        $result = $this->db->get_where($this::TABLE_NAME, array(
            'name' => $name,
            'receiver_name' => $receiver_name,
            'date' => $date,
            'reference_number' => $reference_number,
            'address' => $address,
            'description' => $description,
            'status' => $status,       
            'type' => $type       
        ));
        if($result->num_rows() > 0) return true;

        // Update
        $this->db->update($this::TABLE_NAME, array(
            'name' => $name,
            'receiver_name' => $receiver_name,
            'date' => $date,
            'reference_number' => $reference_number,
            'address' => $address,
            'description' => $description,
            'status' => $status,
            'type' => $type
        ), "id='{$id}'");
        
        return $this->db->affected_rows();
    }

    public function delete_delivery_order($id){
        $this->db->delete($this::TABLE_NAME, "id='{$id}'");
        return $this->db->affected_rows();
    }
}
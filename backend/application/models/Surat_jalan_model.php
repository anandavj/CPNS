<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class surat_jalan_model extends CI_Model{

    private const TABLE_NAME = 'surat_jalan';
    public function insert_surat_jalan($name, $receiver_name, $date, $reference_number, $address,
    $items, $description){
        $this->db->insert($this::TABLE_NAME, array(
            'name' => $name,
            'receiver_name' => $receiver_name,
            'date' => $date,
            'reference_number' => $reference_number,
            'address' => $address,
            'items' => $items,
            'description' => $description,
        ));
        
        return $this->db->affected_rows();
    }

    public function get_all_surat_jalan(){
        return $this->db->get($this::TABLE_NAME)->result_array();
    }

    public function get_surat_jalan_where($id){
        return $this->db->get_where($this::TABLE_NAME, "id='{$id}'")->result_array();
    }

    public function is_not_exists($id){
        if($this->db->get_where($this::TABLE_NAME, "id='{$id}'")->num_rows() == 0) return true;
        else return false;
    }

    public function update_surat_jalan($id, $name, $receiver_name, $date, $reference_number, $address,
    $items, $description){
        // Check apakah tidak merubah apa-apa?
        // kenapa perlu? karena jika update tidak ada perubahan affected_rows() return 0
        $result = $this->db->get_where($this::TABLE_NAME, array(
            'name' => $name,
            'receiver_name' => $receiver_name,
            'date' => $date,
            'reference_number' => $reference_number,
            'address' => $address,
            'items' => $items,
            'description' => $description       
        ));
        if($result->num_rows() > 0) return true;

        // Update
        $this->db->update($this::TABLE_NAME, array(
            'name' => $name,
            'receiver_name' => $receiver_name,
            'date' => $date,
            'reference_number' => $reference_number,
            'address' => $address,
            'items' => $items,
            'description' => $description
        ), "id='{$id}'");
        
        return $this->db->affected_rows();
    }

    public function delete_surat_jalan($id){
        $this->db->delete($this::TABLE_NAME, "id='{$id}'");
        return $this->db->affected_rows();
    }
}
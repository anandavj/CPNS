<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Product_model extends CI_Model{

    private const TABLE_NAME = 'product';
    public function insert_product($name, $category_id, $specification, $description, $stock, $unit_id, $open_price, $bottom_price){
        
        if(!isset($stock)){
            $stock = 0;
        }
       
        $this->db->insert($this::TABLE_NAME, array(
            'name' => $name,
            'category_id ' => $category_id,
            'specification' => $specification,
            'description' => $description,
            'stock' => $stock,
            'unit_id' => $unit_id,
            'open_price' => $open_price,
            'bottom_price' => $bottom_price
        ));
        return $this->db->insert_id();
    }

    public function get_all_product(){
        return $this->db->get($this::TABLE_NAME)->result_array();
    }

    public function get_product_where($id){
        return $this->db->get_where($this::TABLE_NAME, "id='{$id}'")->result_array();
    }

    public function is_not_exists($id){
        if($this->db->get_where($this::TABLE_NAME, "id='{$id}'")->num_rows() == 0) return true;
        else return false;
    }

    public function update_product($id, $datas){
        // Check apakah tidak merubah apa-apa?
        // kenapa perlu? karena jika update tidak ada perubahan affected_rows() return 0
        $result = $this->db->get_where($this::TABLE_NAME, $datas);
        if($result->num_rows() > 0) return true;

        // Update
        $this->db->update($this::TABLE_NAME, $datas, "id='{$id}'");
        
        return $this->db->affected_rows();
    }

    public function delete_product($id){
        $this->db->delete($this::TABLE_NAME, "id='{$id}'");
        return $this->db->affected_rows();
    }
}
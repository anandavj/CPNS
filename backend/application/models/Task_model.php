<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Task_model extends CI_Model{

    private const TABLE_NAME = 'task';
    public function insert_task($action, $label){
        $this->db->insert($this::TABLE_NAME, array(
            'action' => $action,
            'label' => $label
        ));
        
        return $this->db->affected_rows();
    }

    public function get_all_task(){
        return $this->db->get($this::TABLE_NAME)->result_array();
    }

    public function get_task_where($id){
        return $this->db->get_where($this::TABLE_NAME, "id='{$id}'")->result_array();
    }

    public function is_not_exists($id){
        if($this->db->get_where($this::TABLE_NAME, "id='{$id}'")->num_rows() == 0) return true;
        else return false;
    }

    public function update_task($id, $action, $label){
        // Check apakah tidak merubah apa-apa?
        // kenapa perlu? karena jika update tidak ada perubahan affected_rows() return 0
        $result = $this->db->get_where($this::TABLE_NAME, array(
            'id' => $id,
            'action' => $action,
            'label' => $label
        ));
        if($result->num_rows() > 0) return true;

        // Update
        $this->db->update($this::TABLE_NAME, array(
            'action' => $action,
            'label' => $label
        ), "id='{$id}'");
        
        return $this->db->affected_rows();
    }

    public function delete_task($id){
        $this->db->delete($this::TABLE_NAME, "id='{$id}'");
        return $this->db->affected_rows();
    }
}
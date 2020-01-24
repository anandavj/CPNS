<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Tasks_model extends CI_Model{

    public function insert_task($action){
        $this->db->insert('tasks', array(
            'action' => $action
        ));
        
        return $this->db->affected_rows();
    }

    public function get_all_tasks(){
        return $this->db->get('tasks')->result_array();
    }

    public function get_task_where($id){
        return $this->db->get_where('tasks', "id='{$id}'")->result_array();
    }

    public function is_not_exists($id){
        if($this->db->get_where('tasks', "id='{$id}'")->num_rows() == 0) return true;
        else return false;
    }

    public function update_task($id, $action){
        // Check apakah tidak merubah apa-apa?
        // kenapa perlu? karena jika update tidak ada perubahan affected_rows() return 0
        $result = $this->db->get_where('tasks', array(
            'id' => $id,
            'action' => $action
        ));
        if($result->num_rows() > 0) return true;

        // Update
        $this->db->update('tasks', array(
            'action' => $action
        ), "id='{$id}'");
        
        return $this->db->affected_rows();
    }

    public function delete_task($id){
        $this->db->delete('tasks', "id='{$id}'");
        return $this->db->affected_rows();
    }
}
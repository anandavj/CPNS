<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Tasks_model extends CI_Model{

    public function insert_task($action){
        $this->db->insert('tasks', array(
            'action' => $action
        ));
        
        if($this->db->affected_rows()) return true;
        else return false;
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
        $this->db->update('tasks', array(
            'action' => $action
        ), "id='{$id}'");
        
        if($this->db->affected_rows()) return true;
        else return false;
    }

    public function delete_task($id){
        $this->db->delete('tasks', "id='{$id}'");

        if($this->db->affected_rows()) return true;
        else return false;
    }
}
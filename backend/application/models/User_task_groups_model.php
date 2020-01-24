<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User_task_groups_model extends CI_Model{

    public function insert_user_task_groups($name){
        $this->db->insert('user_task_groups', array(
            'name' => $name
        ));
        
        if($this->db->affected_rows()) return true;
        else return false;
    }

    public function get_all_user_task_groups(){
        return $this->db->get('user_task_groups')->result_array();
    }

    public function get_user_task_groups_where($id){
        return $this->db->get_where('user_task_groups', "id='{$id}'");
    }

    public function is_not_exists($id){
        if($this->db->get_where('user_task_groups', "id='{$id}'")->num_rows() == 0) return true;
        else false;
    }

    public function update_user_task_groups($id, $name){
        $this->db->update('user_task_groups', array(
            'name' => $name
        ), "id='{$id}'");
        
        if($this->db->affected_rows()) return true;
        else return false;
    }

    public function delete_user_task_groups($id){
        $this->db->delete('user_task_groups', "id='{$id}'");

        if($this->db->affected_rows()) return true;
        else return false;
    }
}
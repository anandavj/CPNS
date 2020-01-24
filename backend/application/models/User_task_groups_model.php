<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User_task_groups_model extends CI_Model{

    public function insert_user_task_group($name){
        $this->db->insert('user_task_groups', array(
            'name' => $name
        ));

        return $this->db->affected_rows();
    }

    public function get_all_user_task_groups(){
        return $this->db->get('user_task_groups')->result_array();
    }

    public function get_user_task_group_where($id){
        return $this->db->get_where('user_task_groups', "id='{$id}'");
    }

    public function is_not_exists($id){
        if($this->db->get_where('user_task_groups', "id='{$id}'")->num_rows() == 0) return true;
        else false;
    }

    public function update_user_task_group($id, $name){
        // Check apakah tidak merubah apa-apa?
        // kenapa perlu? karena jika update tidak ada perubahan affected_rows() return 0
        $result = $this->db->get_where('user_task_groups', array(
            'id' => $id,
            'name' => $name
        ));
        if($result->num_rows() > 0) return true;

        // Update
        $this->db->update('user_task_groups', array(
            'name' => $name
        ), "id='{$id}'");
        
        return $this->db->affected_rows();
    }

    public function delete_user_task_group($id){
        $this->db->delete('user_task_groups', "id='{$id}'");
        return $this->db->affected_rows();
    }
}
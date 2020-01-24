<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Group_tasks_model extends CI_Model{

    public function insert_group_task($user_task_group_id, $task_id){
        $this->db->insert('group_tasks', array(
            'user_task_group_id' => $user_task_group_id,
            'task_id' => $task_id
        ));
        
        return $this->db->affected_rows();
    }

    public function get_all_group_tasks(){
        return $this->db->get('group_tasks')->result_array();
    }

    public function get_group_task_where($id){
        return $this->db->get_where('group_tasks', "id='{$id}'")->result_array();
    }

    public function is_not_exists($id){
        if($this->db->get_where('group_tasks', "id='{$id}'")->num_rows() == 0) return true;
        else return false;
    }

    public function update_group_task($id, $user_task_group_id, $task_id){
        // Check apakah tidak merubah apa-apa?
        // kenapa perlu? karena jika update tidak ada perubahan affected_rows() return 0
        $result = $this->db->get_where('group_tasks', array(
            'id' => $id,
            'user_task_group_id' => $user_task_group_id,
            'task_id' => $task_id
        ));
        if($result->num_rows() > 0) return true;

        // Update
        $this->db->update('group_tasks', array(
            'user_task_group_id' => $user_task_group_id,
            'task_id' => $task_id
        ), "id='{$id}'");
        
        return $this->db->affected_rows();
    }

    public function delete_group_task($id){
        $this->db->delete('group_tasks', "id='{$id}'");
        return $this->db->affected_rows();
    }
}
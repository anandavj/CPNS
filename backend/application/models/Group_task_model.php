<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Group_task_model extends CI_Model{
    private const TABLE_NAME = 'group_task';

    public function insert_group_task($user_task_group_id, $task_id){
        $this->db->insert($this::TABLE_NAME, array(
            'user_task_group_id' => $user_task_group_id,
            'task_id' => $task_id
        ));
        
        return $this->db->affected_rows();
    }

    public function get_all_group_task(){
        $id = 1;
        $this->db->select('id, user_task_group_id as '.Schema::USER_TASK_GROUP_ID.
        ', task_id as '.Schema::USER_TASK_ID);
        $this->db->from($this::TABLE_NAME);
        return $this->db->get()->result_array();
    }

    public function get_group_task_where($id){
        $this->db->select('id, user_task_group_id as '.Schema::USER_TASK_GROUP_ID.
        ', task_id as '.Schema::USER_TASK_ID);
        $this->db->from($this::TABLE_NAME);
        $this->db->where("id='{$id}'");
        return $this->db->get()->result_array();
    }

    public function is_not_exists($id){
        if($this->db->get_where($this::TABLE_NAME, "id='{$id}'")->num_rows() == 0) return true;
        else return false;
    }

    public function update_group_task($id, $user_task_group_id, $task_id){
        // Check apakah tidak merubah apa-apa?
        // kenapa perlu? karena jika update tidak ada perubahan affected_rows() return 0
        $result = $this->db->get_where($this::TABLE_NAME, array(
            'id' => $id,
            'user_task_group_id' => $user_task_group_id,
            'task_id' => $task_id
        ));
        if($result->num_rows() > 0) return true;

        // Update
        $this->db->update($this::TABLE_NAME, array(
            'user_task_group_id' => $user_task_group_id,
            'task_id' => $task_id
        ), "id='{$id}'");
        
        return $this->db->affected_rows();
    }

    public function delete_group_task($id){
        $this->db->delete($this::TABLE_NAME, "id='{$id}'");
        return $this->db->affected_rows();
    }
}
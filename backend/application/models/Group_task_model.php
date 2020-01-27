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
        $this->db->select('id, user_task_group_id as '.Schema::USER_TASK_GROUP_ID.
        ', task_id as '.Schema::TASK_ID);
        $this->db->from($this::TABLE_NAME);
        return $this->db->get()->result_array();
    }

    public function get_group_task_where($user_task_group_id){
        $this->db->select('group_task.user_task_group_id as '.Schema::USER_TASK_GROUP_ID.
        ', user_task_group.name, task.action');
        $this->db->from($this::TABLE_NAME);
        $this->db->join('user_task_group', 'group_task.user_task_group_id=user_task_group.id');
        $this->db->join('task', 'group_task.task_id=task.id');
        $this->db->where($this::TABLE_NAME.".user_task_group_id='{$user_task_group_id}'");
        
        $result = array();
        $action = array();
        foreach($this->db->get()->result_array() as $row){
            $result[Schema::USER_TASK_GROUP_ID] = $row[Schema::USER_TASK_GROUP_ID];
            array_push($action, $row['action']);
        }
        $result['action'] = $action;
        return $result;
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
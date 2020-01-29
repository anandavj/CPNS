<?php
defined('BASEPATH') or exit('No direct script access allowed');

class User_task_model extends CI_Model
{
    private const TABLE_NAME = 'user_task';

    public function insert_user_task($user_id, $data)
    {
        foreach ($data as $task_id) {
            $this->db->select('user_id','task_id');
            

            $check = $this->db->get_where($this::TABLE_NAME, array('user_id'=>$user_id, 'task_id'=>$task_id));

            if ($check->num_rows() == 0) {

                $this->db->insert($this::TABLE_NAME, array(
                    'user_id' => $user_id,
                    'task_id' => $task_id
                ));
            }
        }


        return $this->db->affected_rows();
    }

    public function get_all_user_task()
    {
        return $this->db->get($this::TABLE_NAME)->result_array();
    }

    public function get_user_task_where($id)
    {
        return $this->db->get_where($this::TABLE_NAME, "id='{$id}'")->result_array();
    }

    public function is_not_exists($user_id)
    {
        if ($this->db->get_where($this::TABLE_NAME, "user_id='{$user_id}'")->num_rows() == 0) return true;
        else false;
    }

    public function update_user_task($user_id, $data){

        $current_tasks = [];
        $result = $this->db->query("select task_id from user_task where user_id = '{$user_id}'")->result_array();
        foreach($result as $row){
            array_push($current_tasks, $row['task_id']);
        }
        $insert_data = array_diff($data, $current_tasks);
        $delete_data = array_diff($current_tasks, $data);

        $this->insert_user_task($user_id, $insert_data);
        foreach($delete_data as $task){
            $this->db->delete($this::TABLE_NAME, array(
                'user_id' => $user_id,
                'task_id' => $task
            ));
        }

        return $this->db->affected_rows();
    }

    public function delete_user_task($user_id)
    {
        $this->db->delete($this::TABLE_NAME, "user_id='{$user_id}'");
        return $this->db->affected_rows();
    }
}
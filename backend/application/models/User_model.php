<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User_model extends CI_Model{
    const TABLE_NAME = "user";

    public function insert_user($user_task_group_id, $name, $telephone, $address, $uid){
        $this->db->insert($this::TABLE_NAME, array(
            'user_task_group_id' => $user_task_group_id,
            'name' => $name,
            'telephone' => $telephone,
            'address' => $address,
            'uid' => $uid
        ));

        return $this->db->affected_rows();
    }

    public function get_all_user(){
        $this->db->select('id, user_task_group_id as '.Schema::USER_TASK_GROUP_ID.', name,
        telephone, address, uid');
        $this->db->from('user');
        return $this->db->get()->result_array();
    }

    public function get_user_where($id){
        $this->db->select('id, user_task_group_id as '.Schema::USER_TASK_GROUP_ID.', name,
        telephone, address, uid');
        $this->db->from('user');
        $this->db->where("id='{$id}'");
        return $this->db->get()->result_array();
    }

    public function is_not_exists($id){
        if($this->db->get_where($this::TABLE_NAME, "id='{$id}'")->num_rows() == 0) return true;
        else false;
    }

    public function update_user($id, $user_task_group_id, $name, $telephone, $address, $uid){
        // Check apakah tidak merubah apa-apa?
        // kenapa perlu? karena jika update tidak ada perubahan affected_rows() return 0
        $result = $this->db->get_where($this::TABLE_NAME, array(
            'user_task_group_id' => $user_task_group_id,
            'name' => $name,
            'telephone' => $telephone,
            'address' => $address,
            'uid' => $uid
        ));
        if($result->num_rows() > 0) return true;

        // Update
        $this->db->update($this::TABLE_NAME, array(
            'user_task_group_id' => $user_task_group_id,
            'name' => $name,
            'telephone' => $telephone,
            'address' => $address,
            'uid' => $uid
        ), "id='{$id}'");
        
        return $this->db->affected_rows();
    }

    public function delete_user($id){
        $this->db->delete($this::TABLE_NAME, "id='{$id}'");
        return $this->db->affected_rows();
    }
}
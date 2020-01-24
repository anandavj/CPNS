<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Users_model extends CI_Model{

    public function insert_user($user_task_group_id, $name, $telephone, $address, $uid){
        $this->db->insert('users', array(
            'user_task_group_id' => $user_task_group_id,
            'name' => $name,
            'telephone' => $telephone,
            'address' => $address,
            'uid' => $uid
        ));

        return $this->db->affected_rows();
    }

    public function get_all_users(){
        return $this->db->get('users')->result_array();
    }

    public function get_user_where($id){
        return $this->db->get_where('users', "id='{$id}'");
    }

    public function is_not_exists($id){
        if($this->db->get_where('users', "id='{$id}'")->num_rows() == 0) return true;
        else false;
    }

    public function update_user($id, $user_task_group_id, $name, $telephone, $address, $uid){
        // Check apakah tidak merubah apa-apa?
        // kenapa perlu? karena jika update tidak ada perubahan affected_rows() return 0
        $result = $this->db->get_where('users', array(
            'user_task_group_id' => $user_task_group_id,
            'name' => $name,
            'telephone' => $telephone,
            'address' => $address,
            'uid' => $uid
        ));
        if($result->num_rows() > 0) return true;

        // Update
        $this->db->update('users', array(
            'user_task_group_id' => $user_task_group_id,
            'name' => $name,
            'telephone' => $telephone,
            'address' => $address,
            'uid' => $uid
        ), "id='{$id}'");
        
        return $this->db->affected_rows();
    }

    public function delete_user($id){
        $this->db->delete('users', "id='{$id}'");
        return $this->db->affected_rows();
    }
}
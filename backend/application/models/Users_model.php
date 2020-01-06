<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Users_model extends CI_Model{
    private $id;
    private $nama;
    private $email;
    private $password;

    public function get_all_users(){
        return $this->db->get('users')->result_array();
    }

    public function login(){
        $this->email = $this->input->post('email');
        $this->password = md5($this->input->post('password'));
        
        $this->db->get_where('users', array(
            'email' => $this->email,
            'password' => $this->password
        ));
        if($this->db->affected_rows()) {
            $this->email = $this->input->post('email');
            return array(
                'status' => TRUE,
                'data' => $this->db->get_where('users', "email='{$this->email}'")->result_array()
            );
        }else {
            return array(
                'status' => FALSE
            );
        }
    }
}
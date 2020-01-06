<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Barang_model extends CI_Model{

    function get_all_barang_by_userid($userid){
        return $this->db->get_where('barang', "userid='{$userid}'")->result_array();
    }

    function insert($barang){
        $this->db->insert('barang', array(
            'nama' => $barang['nama'],
            'harga' => $barang['harga'],
            'userid' => $barang['userid']
        ));

        if($this->db->affected_rows()) return true;
        else return false;
    }

    function update($data){
        $this->db->update('barang', array(
            'nama' => $data['nama'],
            'harga' => $data['harga'],
        ), "id='{$data['id']}'");
        if($this->db->affected_rows()) return true;
        else return false;
    }

    function delete($id){
        $this->db->delete('barang', "id='{$id}'");
        if($this->db->affected_rows()) return true;
        else return false;
    }
}
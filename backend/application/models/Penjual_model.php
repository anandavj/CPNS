<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Penjual_model extends CI_Model{

    function get_all_penjual_by_userid($userid){
        return $this->db->get_where('penjual', "userid='{$userid}'")->result_array();
    }

    function insert($penjual){
        $this->db->insert('penjual', array(
            'nama' => $penjual['nama'],
            'alamat' => $penjual['alamat'],
            'nohp' => $penjual['nohp'],
            'userid' => $penjual['userid']
        ));

        if($this->db->affected_rows()) return true;
        else return false;
    }

    function update($data){
        $this->db->update('penjual', array(
            'nama' => $data['nama'],
            'alamat' => $data['alamat'],
            'nohp' => $data['nohp']
        ), "id='{$data['id']}'");
        if($this->db->affected_rows()) return true;
        else return false;
    }

    function delete($id){
        $result = $this->db->get_where('transaksi', "transaksi.penjualid='{$id}'");
        if($result->num_rows() > 0) return false;
        $this->db->delete('penjual', "id='{$id}'");
        if($this->db->affected_rows()) return true;
        else return false;
    }
}
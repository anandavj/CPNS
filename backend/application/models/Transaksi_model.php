<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Transaksi_model extends CI_Model{

    function get_all_transaksi_by_userid($userid){
        $this->db->select('transaksi.*, barang.nama as barang, penjual.nama as penjual');
        $this->db->from('transaksi');
        $this->db->join('barang', 'transaksi.barangid=barang.id');
        $this->db->join('penjual', 'transaksi.penjualid=penjual.id');
        $this->db->where("transaksi.userid='{$userid}'");
        return $this->db->get()->result_array();
    }

    function insert($transaksi){
        $this->db->insert('transaksi', array(
            'penjualid' => $transaksi['penjualid'],
            'barangid' => $transaksi['barangid'],
            'userid' => $transaksi['userid'],
            'harga' => $transaksi['harga'],
            'berat' => $transaksi['berat'],
            'tanggal' => $transaksi['tanggal'],
        ));

        if($this->db->affected_rows()) return true;
        else return false;
    }

    function update($data){
        $this->db->update('transaksi', array(
            'penjualid' => $data['penjualid'],
            'barangid' => $data['barangid'],
            'harga' => $data['harga'],
            'berat' => $data['berat']
        ), "id='{$data['id']}'");
        if($this->db->affected_rows()) return true;
        else return false;
    }

    function delete($id){
        $this->db->delete('transaksi', "id='{$id}'");
        if($this->db->affected_rows()) return true;
        else return false;
    }
}
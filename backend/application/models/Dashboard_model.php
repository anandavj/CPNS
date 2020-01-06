<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard_model extends CI_Model{

    function get_all_transaksi_per_month($userid){
        $this->db->select('month(tanggal) as bulan, sum(harga*berat) as total');
        $this->db->from('transaksi');
        $this->db->group_by('year(tanggal), month(tanggal)');
        $this->db->order_by('month(tanggal) ASC');
        $this->db->where('year(tanggal)=year(Now())');
        return $this->db->get()->result_array();
    }
}
<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Excel_import_model extends CI_Model{
    
    function select(){
        $this->db->order_by();
        $query = $this->db->get('table');
         
        return $query;
    }

}
?> 
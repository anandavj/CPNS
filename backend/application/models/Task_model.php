<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Task_model extends CI_Model{

    private const TABLE_NAME = 'task';
    public function insert_task($action, $label, $modul){
        $this->db->insert($this::TABLE_NAME, array(
            'action' => $action,
            'label' => $label,
            'modul' => $modul
        ));
        
        return $this->db->affected_rows();
    }

    public function get_all_task(){
        $result = $this->db->get($this::TABLE_NAME);
        $currentModul = null;
        $array = array();
        foreach($result->result_array() as $row){
            if($row['modul'] != $currentModul){
                array_push($array, $row['modul']);
                array_push($array['modul'], $row['action']);
            }
        }
        return $array;
    }

    public function get_task_where($id){
        return $this->db->get_where($this::TABLE_NAME, "id='{$id}'")->result_array();
    }

    public function is_not_exists($id){
        if($this->db->get_where($this::TABLE_NAME, "id='{$id}'")->num_rows() == 0) return true;
        else return false;
    }

    public function update_task($id, $action, $label, $modul){
        // Check apakah tidak merubah apa-apa?
        // kenapa perlu? karena jika update tidak ada perubahan affected_rows() return 0
        $result = $this->db->get_where($this::TABLE_NAME, array(
            'id' => $id,
            'action' => $action,
            'label' => $label,
            'modul' => $modul
        ));
        if($result->num_rows() > 0) return true;

        // Update
        $this->db->update($this::TABLE_NAME, array(
            'action' => $action,
            'label' => $label,
            'modul' => $modul
        ), "id='{$id}'");
        
        return $this->db->affected_rows();
    }

    public function delete_task($id){
        $this->db->delete($this::TABLE_NAME, "id='{$id}'");
        return $this->db->affected_rows();
    }
}
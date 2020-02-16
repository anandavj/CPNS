<?php
defined('BASEPATH') or exit('No direct script access allowed');

class product_variant_model extends CI_Model
{
    private const TABLE_NAME = 'product_variant';

    public function insert_product_variant($product_id, $size)
    {
        $result = $this->db->insert($this::TABLE_NAME, array(
            'product_id' => $product_id,
            'size_a' => $size[0],
            'size_b' => $size[1],
            'size_c' => $size[2],
            'size_d' => $size[3]
        ));
        return $this->db->affected_rows();
    }

    public function get_all_product_variant()
    {
        $this->db->select('id, product_id as productId, size_a as sizeA, size_b as sizeB, size_c as sizeC, size_d as sizeD');
        $this->db->from($this::TABLE_NAME);
        return $this->db->get()->result_array();
    }

    public function get_product_variant_where($product_id)
    {
        $this->db->select('id, product_id as productId, size_a as sizeA, size_b as sizeB, size_c as sizeC, size_d as sizeD');
        $this->db->from($this::TABLE_NAME);
        $this->db->where($this::TABLE_NAME . ".product_id='{$product_id}'");
        return $this->db->get()->result_array();
        
    }

    public function is_not_exists($id)
    {
        if ($this->db->get_where($this::TABLE_NAME, "id='{$id}'")->num_rows() == 0) return true;
        else return false;
    }

    public function update_product_variant($id, $product_id, $size)
    {
        $this->db->update($this::TABLE_NAME,array(
            'product_id' => $product_id,
            'size_a' => $size[0],
            'size_b' => $size[1],
            'size_c' => $size[2],
            'size_d' => $size[3]
        ),"id = '{$id}'"
    );

        return $this->db->affected_rows();
    }

    public function delete_product_variant($id)
        {
            $this->db->delete($this::TABLE_NAME, "id='{$id}'");
            return $this->db->affected_rows();
        }
}
//         // Check apakah tidak merubah apa-apa?
//         // kenapa perlu? karena jika update tidak ada perubahan affected_rows() return 0
//         $result = $this->db->get_where($this::TABLE_NAME, array(
//             'user_task_group_id' => $user_task_group_id
//         ))->result_array();

//         $current_tasks = [];
//         foreach ($result as $row) {
//             array_push($current_tasks, $row['task_id']);
//         }

//         $insert_data = array_diff($task_id, $current_tasks);
//         $delete_data = array_diff($current_tasks, $task_id);

//         // return $insert_data;

//         $this->insert_product_variant($user_task_group_id, $insert_data);

//         foreach ($delete_data as $task) {
//             $this->db->delete($this::TABLE_NAME, array(
//                 'user_task_group_id' => $user_task_group_id,
//                 'task_id' => $task
//             ));
//         }


//         // Update task pada semua user dalam grup
//         $new_task = [];
//         $result = $this->db->get_where($this::TABLE_NAME, array(
//             'user_task_group_id' => $user_task_group_id
//         ))->result_array();
//         foreach ($result as $row) {
//             array_push($new_task, $row['task_id']);
//         }

//         return $new_task;
//     }

//     public function delete_product_variant($user_task_group_id)
//     {
//         $this->db->delete($this::TABLE_NAME, "user_task_group_id='{$user_task_group_id}'");
//         return $this->db->affected_rows();
//     }
// }

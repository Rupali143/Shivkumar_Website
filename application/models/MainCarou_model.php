<?php

class MainCarou_model extends CI_Model {

    public function saveaMain($post_data, $adv_img) {
        if (!empty($_FILES['carous_image']['tmp_name'])) {
            $main_img = 'folder/Main/' . $adv_img;
        } else {
            $main_img = "";
        }
        $dt = new DateTime(null, new DateTimezone("Asia/Kolkata"));
        $reg_date = $dt->format('Y-m-d H:i:s');
        $data = array(
            'carous_image' => $main_img,
            'image_caption' => $post_data['image_caption'],
            'date' => $reg_date,
            'status_id' => $post_data['status_id']
        );

        $result = $this->db->insert('shiv_categories', $data);
        return $this->db->insert_id();
    }

    function show_adminImg() {
        $query = "SELECT * FROM `shiv_categories`";
//         echo $query;die();
        $result = $this->db->query($query);
        $profile_data = $result->result_array();
//        print_r($profile_data);die();
        return $profile_data;
    }

    function adminchange_status($id) {
        $adv_data = $this->MainCarou_model->filter_adv($id, 'shiv_categories', 'carous_id');

        if ($adv_data[0]['status_id'] == "1")
            $status_id = 0;
        else
            $status_id = 1;
        //echo "<pre>";print_r($status_id);
        $data = array('status_id' => $status_id);
        //echo "<pre>";print_r($data);
        //die();
        $this->db->where('carous_id', $id);
        $result = $this->db->update('shiv_categories', $data);
        return $result;
    }

    function filter_adv($id, $table_name, $table_id) {
        $this->db->where($table_id, $id);
        $result = $this->db->get($table_name);
        return $result->result_array();
    }

    function delete($id) {
        return $this->db->delete('shiv_categories', array('carous_id' => $id));
    }

}

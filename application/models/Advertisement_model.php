<?php

class Advertisement_model extends CI_Model {

    public function saveAdvertise($post_data, $adv_img) {
       // print_r($post_data);echo $adv_img;die();
        if (!empty($_FILES['advertise_image']['tmp_name'])) {
            $main_img = 'folder/Advertise/' . $adv_img;
        } else {
            $main_img = "";
        }
        $dt = new DateTime(null, new DateTimezone("Asia/Kolkata"));
//             $dt = new DateTime();
        $reg_date = $dt->format('Y-m-d H:i:s');
        $data = array(
            'advertise_image' => $main_img,
            'image_caption' => $post_data['image_caption'],
            'date' => $reg_date,
            'status_id' => $post_data['status_id']
        );

        $result = $this->db->insert('shiv_advertisement', $data);
       // print_r($result);die;
        return $this->db->insert_id();
//        return $result;
    }

    function show_advertisement() {
        $query = "SELECT * FROM `shiv_advertisement`";
//         echo $query;die();
        $result = $this->db->query($query);
        $profile_data = $result->result_array();
//        print_r($profile_data);die();
        return $profile_data;
    }

    function adminchange_status($id) {
        $adv_data = $this->Advertisement_model->filter_adv($id, 'shiv_advertisement', 'adv_id');

        if ($adv_data[0]['status_id'] == "1")
            $status_id = 0;
        else
            $status_id = 1;
        //echo "<pre>";print_r($status_id);
        $data = array('status_id' => $status_id);
        //echo "<pre>";print_r($data);
        //die();
        $this->db->where('adv_id', $id);
        $result = $this->db->update('shiv_advertisement', $data);
        return $result;
    }

    function filter_adv($id, $table_name, $table_id) {
        $this->db->where($table_id, $id);
        $result = $this->db->get($table_name);
        return $result->result_array();
    }

    function delete($id) {
        return $this->db->delete('shiv_advertisement', array('adv_id' => $id));
    }

}

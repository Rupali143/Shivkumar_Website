<?php

class Engagement_model extends CI_Model {

    public function saveaMain($post_data, $adv_img) {
        if (!empty($_FILES['engagement_image']['tmp_name'])) {
            $main_img = 'folder/engagement/' . $adv_img;
        } else {
            $main_img = "";
        }
        $dt = new DateTime(null, new DateTimezone("Asia/Kolkata"));
        $reg_date = $dt->format('Y-m-d H:i:s');
        $data = array(
            'engagement_image' => $main_img,
            'image_caption' => $post_data['image_caption'],
            'date' => $reg_date,
            'status_id' => $post_data['status_id']
        );
        // print_r($data);die;
        $result = $this->db->insert('shiv_engagement', $data);
        return $this->db->insert_id();
    }

    function show_engagement() {
        $query = "SELECT * FROM `shiv_engagement`";
//         echo $query;die();
        $result = $this->db->query($query);
        $profile_data = $result->result_array();
//        print_r($profile_data);die();
        return $profile_data;
    }

    function adminchange_status($id) {
        $adv_data = $this->Engagement_model->filter_adv($id, 'shiv_engagement', 'eng_id');

        if ($adv_data[0]['status_id'] == "1")
            $status_id = 0;
        else
            $status_id = 1;
        $data = array('status_id' => $status_id);
        $this->db->where('eng_id', $id);
        $result = $this->db->update('shiv_engagement', $data);
        return $result;
    }

    function filter_adv($id, $table_name, $table_id) {
        $this->db->where($table_id, $id);
        $result = $this->db->get($table_name);
        return $result->result_array();
    }

    function delete($id) {
        return $this->db->delete('shiv_engagement', array('eng_id' => $id));
    }

}

<?php

class PreWedding_model extends CI_Model {

    public function saveaMain($post_data, $adv_img) {
        if (!empty($_FILES['preWedding_image']['tmp_name'])) {
            $main_img = 'folder/preWedding/' . $adv_img;
        } else {
            $main_img = "";
        }
        $dt = new DateTime(null, new DateTimezone("Asia/Kolkata"));
        $reg_date = $dt->format('Y-m-d H:i:s');
        $data = array(
            'preWedding_image' => $main_img,
            'preWedding_caption' => $post_data['preWedding_caption'],
            'date' => $reg_date,
            'status_id' => $post_data['status_id']
        );

        $result = $this->db->insert('shiv_prewedding', $data);
        return $this->db->insert_id();
    }

    function show_adminImg() {
        $query = "SELECT * FROM `shiv_prewedding`";
        $result = $this->db->query($query);
        $profile_data = $result->result_array();
        return $profile_data;
    }

    function adminchange_status($id) {
        $adv_data = $this->PreWedding_model->filter_adv($id, 'shiv_prewedding', 'preWedding_id');

        if ($adv_data[0]['status_id'] == "1")
            $status_id = 0;
        else
            $status_id = 1;
        $data = array('status_id' => $status_id);
        $this->db->where('preWedding_id', $id);
        $result = $this->db->update('shiv_prewedding', $data);
        return $result;
    }

    function filter_adv($id, $table_name, $table_id) {
        $this->db->where($table_id, $id);
        $result = $this->db->get($table_name);
        return $result->result_array();
    }

    function delete($id) {
        return $this->db->delete('shiv_prewedding', array('preWedding_id' => $id));
    }

}

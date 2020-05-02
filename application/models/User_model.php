<?php
class User_Model extends CI_Model {

    var $table = 'nr_users';

    function __construct() {
        parent::__construct();
        $this->load->library("auth");
    }

     function user_login($userlogin_data) {
        // echo "<pre>";print_r($userlogin_data);
        // die();
        $username = $userlogin_data['txtuname'];
        $password = md5($userlogin_data['txtupswd']);
        //echo "password";print_r($password);
        $condition = "user_name =" . "'" . $username . "' AND " . "user_password =" . "'" . $password . "' AND status_id=1";
        $this->db->select('user_name,user_password,role_id,user_id');
        $this->db->from('nr_users');
        $this->db->where($condition);
        $this->db->limit(1);
        $query = $this->db->get();
        //echo "<pre>";print_r($query->result_array());
        //die();
        if ($query->num_rows() == 1) {
            $result = $query->result_array();
        } else {
            $result = array();
        }
        return $result;
    }

    public function get($where, $value = FALSE) {
        if (!$value) {
            $value = $where;
            $where = 'user_id';
        }

        $user = $this->db->where($where, $value)->get($this->table)->row_array();
        return $user;
    }
}

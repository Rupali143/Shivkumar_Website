<?php

class Status_Model extends CI_Model {

    function __construct() {
        parent::__construct();
    }

    function getStatus() {
        $select_fields = array('status_id', 'status');
        $sql_query = $this->querygenerator->simpleSelect('shiv_status', $select_fields);
        $result = $this->db->query($sql_query);
        return $result->result_array();
    }

}

<?php

class Home_model extends CI_Model {

    function get_imgCarouse(){
    	 $query = "SELECT * FROM shiv_categories where status_id=1";
    	 return $result=$this->db->query($query)->result_array();
    	 // print_r($result);die;
    }

    function save_contact($cont_data){
    	// print_r($cont_data);die;
     	$data =array(
     		'name'=>$cont_data['name'],
     		'email'=>$cont_data['email'],
     		'subject'=>$cont_data['subject'],
     		'message'=>$cont_data['message'],
     	);
     	$result = $this->db->insert('sp_contact',$data);
     	return $result;
    }

	function get_imgModel(){
     $query = "SELECT * FROM shiv_modeling where status_id=1";
     return $result=$this->db->query($query)->result_array();
    }

    function get_imgMaternity(){
     $query = "SELECT * FROM shiv_maternity where status_id=1";
     return $result=$this->db->query($query)->result_array();
    }

    function get_imgEngagement(){
     $query = "SELECT * FROM shiv_engagement where status_id=1";
     return $result=$this->db->query($query)->result_array();
    }

    function get_gif(){
     $query = "SELECT * FROM shiv_gif where status_id=1";
     return $result=$this->db->query($query)->result_array();
    }

    function get_team(){
     $query = "SELECT * FROM shiv_team where status_id=1";
     return $result=$this->db->query($query)->result_array();
    }

    function get_wedding(){
     $query = "SELECT * FROM shiv_wedding where status_id=1";
     return $result=$this->db->query($query)->result_array();
    }

    function get_DestinationWedding(){
     $query = "SELECT * FROM shiv_destinationwedding where status_id=1";
     return $result=$this->db->query($query)->result_array();
    }

    function get_bridal(){
     $query = "SELECT * FROM shiv_bridal where status_id=1";
     return $result=$this->db->query($query)->result_array();
    }

     function get_makeup(){
     $query = "SELECT * FROM shiv_makeup where status_id=1";
     return $result=$this->db->query($query)->result_array();
    }

    function get_preWedding(){
     $query = "SELECT * FROM shiv_preWedding where status_id=1";
     return $result=$this->db->query($query)->result_array();
    }

    function get_postWedding(){
     $query = "SELECT * FROM shiv_postWedding where status_id=1";
     return $result=$this->db->query($query)->result_array();
    }

    function get_futurewedding(){
     $query = "SELECT * FROM shiv_futurewedding where status_id=1";
     return $result=$this->db->query($query)->result_array();
    }
}
<?php

class Admin extends CI_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->library('auth');
        $this->load->model('User_model');
    }

    function dashboard() {
        $this->load->view('Admin/header');
        $this->load->view('Admin/template');
        $this->load->view('Admin/footer');
    }

     public function index() {
        // in case you did not autoload the library
        if (!$this->auth->loggedin()) {
            redirect('login');
        }
        // get current user id
        $id = $this->auth->userid();
        // get user from database
        $user = $this->User_model->get('user_id', $id);
        // print_r($user);
        redirect('Admin/dashboard');
        // echo 'Welcome to the super secret section, ' . $user['user_name'];
    }

}

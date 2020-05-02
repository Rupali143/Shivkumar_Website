<?php

class Login extends CI_Controller {

    function __construct() {
        parent::__construct();
        $this->load->model('User_model');
        $this->load->library('auth');
		
    }

    function index() {
        // echo'Login';die;
        $this->add_view();
    }

    function add_view() {
        $this->load->view('admin/login');
    }

    function user_login() {
        // user is already logged in
//        if ($this->auth->loggedin()) {
//            redirect('admin');
//        }
        $this->form_validation->set_rules('txtuname', 'Username', 'trim|required|xss_clean');
        $this->form_validation->set_rules('txtupswd', 'Password', 'trim|required|xss_clean');

        if ($this->form_validation->run() == FALSE) {
            $this->add_view();
        } else {
            $remember = $this->input->post('remember') ? TRUE : FALSE;
            $post_data = $this->input->post();
            $result = $this->user_model->user_login($post_data);
            //echo "<pre>";print_r($result);
            //die();
            if (!(empty($result))) {
                $session_data = array(
                    'username' => $result[0]['user_name'],
                    'userrole' => $result[0]['role_id'],
                    'userid' => $result[0]['user_id'],
                );
//                     Add user data in session
                $user = $this->user_model->get('user_name', $this->input->post('user_name'));
                
                $this->session->set_userdata('logged_in', $session_data['username']);
                $this->session->set_userdata('user_role', $session_data['userrole']);
                $this->session->set_userdata('user_id', $session_data['userid']);
                // mark user as logged in
                $this->auth->login($user['user_id'], $remember);
                 redirect('Admindashboard');
//                $usertraking = $this->usertracking_model->save("login", "login");
//                if ($usertraking) {
//                	//echo "fdgf";die();
//                    redirect('profile');
//                } else {
//                    $this->session->set_flashdata('error', 'Opps!!Something went wrong in UserTracking.');
//                    redirect('profile');
//                }
            } else if (empty($result)) {
                $this->session->set_flashdata('error', 'Invalid Username Or Password.');
                redirect('login');
            }
        }
    }
    //admin login
     function user_loginadmin() { 
        // user is already logged in
//        if ($this->auth->loggedin()) {
//            redirect('admin');
//        }
        // $this->form_validation->set_rules('txtuname', 'Username', 'required|xss_clean');
        // $this->form_validation->set_rules('txtupswd', 'Password', 'required|xss_clean');

        // if ($this->form_validation->run() == FALSE) {
        //     echo 'if';
        //     $this->add_view();
        // } else {
            // echo 'else';die;
            $remember = $this->input->post('remember') ? TRUE : FALSE;
            $post_data = $this->input->post();
            $result = $this->User_model->user_login($post_data);
            // echo "<pre>";print_r($result);
            // die();
            if (!(empty($result))) {
                $session_data = array(
                    'username' => $result[0]['user_name'],
                    'userrole' => $result[0]['role_id'],
                    'userid' => $result[0]['user_id'],
                );
//                     Add user data in session
                $user = $this->User_model->get('user_name', $this->input->post('user_name'));
                
                $this->session->set_userdata('logged_in', $session_data['username']);
                $this->session->set_userdata('user_role', $session_data['userrole']);
                $this->session->set_userdata('user_id', $session_data['userid']);
                // mark user as logged in
                $this->auth->login($user['user_id'], $remember);
                //$usertraking = $this->usertracking_model->save("login", "login");
//                if ($usertraking) {                
                	if(($this->session->userdata('user_role') == 0)||($this->session->userdata('user_role') == 1))
                    		{ //redirect('profile');
                                redirect('Admin/dashboard');
                                
                                }else if(($this->session->userdata('user_role') == 4)){
                                    $uid=$this->session->userdata('user_id');
                                    //$res=$this->profile_model->getdpid($uid);
                                    //print_r($res);die();
                                    $this->session->set_userdata('dpid',$res[0]['dp_id']);
                    		redirect('profile/edit_view/'.$res[0]['dp_id']); 
                                
                                }
                    else{
                    	$this->session->set_flashdata('error', 'You are not authorised user.');
                	redirect('login');
                    }
//                } else {
//                    $this->session->set_flashdata('error', 'Opps!!Something went wrong in UserTracking.');
//                    redirect('profile');
//                }
            } else if (empty($result)) {
                $this->session->set_flashdata('error', 'Invalid Username Or Password.');
                redirect('login');
            }
        // }
    }
	
	


    // Logout from admin page
    public function user_logout() {
        $sess_array = array(
            'username' => '',
            'userrole' => '',
            'userid' => ''
        );
//        $usertraking = $this->usertracking_model->save("logout", "logout");
//        if ($usertraking) {
            $this->session->unset_userdata('logged_in', $sess_array);
            $this->session->unset_userdata('user_role', $sess_array);
            $this->session->unset_userdata('user_id', $sess_array);
            $this->session->set_flashdata('success', 'Successfully Logout.');
            redirect('login');
    }
    /*
    public function forgot_password() {
        $this->load->library('form_validation');
        $this->form_validation->set_rules('user_login', 'Email', 'required|valid_email|min_length[5]|max_length[125]');

        if ($this->form_validation->run() == FALSE) {
        	$this->session->set_flashdata('error', 'Opps!!Not a valid email.');
            redirect('login');
          //$this->load->view('signin/forgot_password');
        } else {
          $email = $this->input->post('user_login');

          $this->db->where('emailid', $email);
          $this->db->from('nr_users_info');
          $num_res = $this->db->count_all_results();

          if ($num_res == 1) {
            // Make a small string (code) to assign to the user // to indicate they've requested a change of // password
            $code = mt_rand('5000', '200000');
            $data = array(
              'user_password' => $code,
            );
            
            $this->db->where('nui.emailid', $email);            
            if ($this->db->update('nr_users nr join nr_users_info nui on nui.user_id = nr.user_id', $data)) {
              // Update okay, send email
              $url = "http://finderbay.com/login/new_password/".$code;
              $body = "\nPlease click the following link to reset your password:\n\n".$url."\n\n";
              if (mail($email, 'Password reset', $body, 'From: noreply@finderbay.com')) {
                $data['submit_success'] = true;
                $this->load->view('signin/signin', $data);
              }
            } else {
              // Some sort of error happened, redirect user // back to form
              $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
              redirect('login');
            }
          } else {
            // Some sort of error happened, redirect user back // to form
            redirect('login');
          }
        }
    }
  
    public function new_password() {
        $this->load->library('form_validation');
        $this->form_validation->set_rules('code', 'Code', 'required|min_length[4]|max_length[7]');
        $this->form_validation->set_rules('email', 'Email', 'required|valid_email|min_length[5]|max_length[125]');
        $this->form_validation->set_rules('password1', 'Password', 'required|min_length[5]|max_length[15]');
        $this->form_validation->set_rules('password2', 'Confirmation Password', 'required|min_length[5]|max_length[15]|matches[password1]');

        // Get Code from URL or POST and clean up
        if ($this->input->post()) {
          $data['code'] = xss_clean($this->input->post('code'));
        } else {
          $data['code'] = xss_clean($this->uri->segment(3));
        }

        if ($this->form_validation->run() == FALSE) {
          $this->load->view('signin/new_password', $data);
        } else {
          // Does code from input match the code against the // email
          $this->load->model('Signin_model');
          $email = xss_clean($this->input->post('email'));
          if (!$this->Signin_model->does_code_match($data['code'], $email)) {
            // Code doesn't match
            redirect ('signin/forgot_password');
          } else {// Code does match
            $this->load->model('Register_model');
            $hash = $this->encrypt->sha1($this->input->post('password1'));

            $data = array(
              'user_hash' => $hash
            );

            if ($this->Register_model->update_user($data, $email)) {
              redirect ('signin');
            }
          }
        }
    }*/
}

?>
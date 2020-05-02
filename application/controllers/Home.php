<?php

class Home extends CI_Controller{
    public function __construct() {
        parent::__construct();
        $this->load->model('Home_model');
    }
    
    function index(){
    	$data['imgCarouse'] = $this->Home_model->get_imgCarouse();
        $data['imgModel'] = $this->Home_model->get_imgModel();
        $data['imgMaternity'] = $this->Home_model->get_imgMaternity();
        $data['imgEngagement'] = $this->Home_model->get_imgEngagement();
        $data['gif'] = $this->Home_model->get_gif();
        $data['team'] = $this->Home_model->get_team();
        $data['wedding'] = $this->Home_model->get_wedding();
        $data['DestinationWedding'] = $this->Home_model->get_DestinationWedding();
        $data['Bridal'] = $this->Home_model->get_bridal();
        $data['Makeup'] = $this->Home_model->get_makeup();
        $data['PreWedding'] = $this->Home_model->get_preWedding();
        $data['PostWedding'] = $this->Home_model->get_postWedding();
        $data['FutureWedding'] = $this->Home_model->get_futurewedding();
        // echo'<pre>';print_r($data['imgModel']);die;
    	$this->load->view('common/header');
        $this->load->view('common/home_view',$data);
        $this->load->view('common/footer');
    }

    function contact(){
    	$p_contact=$this->input->post();
    	$result = $this->Home_model->save_contact($p_contact);
    	redirect('Home');
    }
    
     function terms(){
    	$this->load->view('common/header');
        $this->load->view('common/terms');
        $this->load->view('common/footer');
    }

    function subscribe(){
    	$form_data = $this->input->post();
        $this->send_mail($form_data);
        redirect('Home');
    }

    function send_mail($data) {
        require_once 'PHPMailer/myphpmailer.php';
        $sendObjPhpmailer = new myphpmailer();
//        $to_email = 'manjushapraveen31@gmail.com';
        $to_email = $data['exampleInputEmail2'];
        //print_r($sendObjPhpmailer);die;
        $url = base_url();
        $femail = 'shreyaphotospalus@gmail.com';
        $subject = 'Verification';
        $content = 'Hi, ' . $data['exampleInputName2'] .
                ',<br>  
                <br><strong>Thank You for Registering!!</strong><br>  
                <br>Thanks & Regards,
                <br>Kiemate Team';
        $resofphp = $sendObjPhpmailer->sendEmail_phpmailer($to_email, $femail, $subject, $content);
        print_r($resofphp);die;
        return $resofphp;
    }

    function pract(){
    	$this->load->view('pactice');
    }
}


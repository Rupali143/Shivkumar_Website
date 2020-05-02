<?php

require_once './application/entity/MainCarouselEntity.php';

class MainCarou extends CI_Controller {

    var $MainCarouselEntity;

    public function __construct() {
        parent::__construct();
        $this->load->model('status_model');
        $this->load->model('MainCarou_model');
        $this->MainCarouselEntity = new MainCarouselEntity();
    }

    function index() {
        $this->add_MainCorousel();
    }

    function add_MainCorousel() {
        $this->formgenerator->setColumns($this->MainCarouselEntity->getFormColumns());
        $this->formgenerator->setNames($this->MainCarouselEntity->getFormLabels());
        $status_list = $this->status_model->getStatus();
        $this->formgenerator->setDropDownValues(array('status' => $status_list));
        $row_form['form'] = $this->formgenerator->generate('categories', TRUE);
        $this->load->view('Admin/header');
        $this->load->view('Admin/add_caroulImg',$row_form);
        $this->load->view('Admin/footer');
    }

    public function saveMain() {
        $this->form_validation->set_rules('carous_image', 'Image Caption', array('required' => '%s should not be empty.'));
        $this->form_validation->set_rules('status_id', 'Status', 'trim|required', array('required' => '%s should not be empty.'));

        if (isset($_FILES["carous_image"]["name"])) {
            if (!(is_dir('folder/Main'))) {
                mkdir('./folder/Main', 0777, true);
            } else {
                
            }
            $config['upload_path'] = './folder/Main';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $this->load->library('upload', $config);
            $this->upload->initialize($config);
            if (!$this->upload->do_upload('carous_image')) {
                echo $this->upload->display_errors();
            } else {
                $data = $this->upload->data();
                $config['image_library'] = 'gd2';
                $config['source_image'] = './folder/Main' . $data["file_name"];
                $config['create_thumb'] = TRUE;
                $config['maintain_ratio'] = TRUE;
                $config['quality'] = '60%';
                $config['width'] = 200;
                $config['height'] = 200;
                $config['new_image'] = './folder/Main' . $data["file_name"];
                $this->load->library('image_lib', $config);
                $this->image_lib->resize();
                if (!$this->image_lib->resize()) {
                    echo $this->image_lib->display_errors();
                }
                $this->image_lib->initialize($config);
                $main_img = array(
                    'name' => $data["file_name"]
                );
            }
        }
        if ($this->form_validation->run() == FALSE || empty($main_img['name'])) {
            if (empty($main_img['name'])) {
                $this->session->set_flashdata('error', 'Opps!!Please select image.');
                $this->add_MainCorousel();
            } else {
                $this->add_MainCorousel();
            }
        } else {
            $post_data = $this->input->post();
            $result = $this->MainCarou_model->saveaMain($post_data, $main_img['name']);
            if ($result) {
                $this->session->set_flashdata('success', 'Successfully Added.');
                redirect('MainCarou/show_MainCorousel');
            } else {
                $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
                redirect('MainCarou/add_MainCorousel');
            }
        }
    }

    function show_MainCorousel() {
        $main_list['mainlist'] = $this->MainCarou_model->show_adminImg();
        $this->load->view('Admin/header');
        $this->load->view('Admin/show_caroulImg', $main_list);
        $this->load->view('Admin/footer');
    }

    function adminchange_status($uadvid) {
        $status_result = $this->MainCarou_model->adminchange_status($uadvid);
        if ($status_result) {
            $this->session->set_flashdata('success', 'Status Updated Successfully');
            redirect('MainCarou/show_MainCorousel');
        } else {
            $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
            redirect('MainCarou/show_MainCorousel');
        }
    }

    public function deleteCarousel($id){
        $result = $this->db->delete('shiv_categories',array('carous_id' => $id));
          if ($result) {
            $this->session->set_flashdata('success', 'Image deleted Successfully');
            redirect('MainCarou/show_MainCorousel');
        } else {
            $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
            redirect('MainCarou/show_MainCorousel');
        }
    }

}

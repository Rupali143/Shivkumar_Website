<?php

require_once './application/entity/WeddingEntity.php';

class WeddingController extends CI_Controller {

    var $WeddingEntity;

    public function __construct() {
        parent::__construct();
        $this->load->model('status_model');
        $this->load->model('Wedding_model');
        $this->WeddingEntity = new WeddingEntity();
    }

    function index() {
        $this->add_Wedding();
    }

    function add_Wedding() {
        $this->formgenerator->setColumns($this->WeddingEntity->getFormColumns());
        $this->formgenerator->setNames($this->WeddingEntity->getFormLabels());
        $status_list = $this->status_model->getStatus();
        $this->formgenerator->setDropDownValues(array('status' => $status_list));
        $row_form['form'] = $this->formgenerator->generate('wedding', TRUE);
           // print_r($row_form);die;
        $this->load->view('Admin/header');
        $this->load->view('Admin/add_Wedding',$row_form);
        $this->load->view('Admin/footer');
    }

    public function saveWedding() {
        $this->form_validation->set_rules('wedding_image', 'Image Caption', array('required' => '%s should not be empty.'));
        $this->form_validation->set_rules('status_id', 'Status', 'trim|required', array('required' => '%s should not be empty.'));

        if (isset($_FILES["wedding_image"]["name"])) {
            if (!(is_dir('folder/wedding'))) {
                mkdir('./folder/wedding', 0777, true);
            } else {
                
            }
            $config['upload_path'] = './folder/wedding';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $this->load->library('upload', $config);
            $this->upload->initialize($config);
            if (!$this->upload->do_upload('wedding_image')) {
                echo $this->upload->display_errors();
            } else {
                $data = $this->upload->data();
                $config['image_library'] = 'gd2';
                $config['source_image'] = './folder/wedding' . $data["file_name"];
                $config['create_thumb'] = TRUE;
                $config['maintain_ratio'] = TRUE;
                $config['quality'] = '60%';
                $config['width'] = 200;
                $config['height'] = 200;
                $config['new_image'] = './folder/wedding' . $data["file_name"];
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
                $this->add_Wedding();
            } else {
                $this->add_Wedding();
            }
        } else {
            $post_data = $this->input->post();
            $result = $this->Wedding_model->saveaMain($post_data, $main_img['name']);
            if ($result) {
                $this->session->set_flashdata('success', 'Successfully Added.');
                redirect('WeddingController/show_Wedding');
            } else {
                $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
                redirect('WeddingController/add_Wedding');
            }
        }
    }

    function show_Wedding() {
        $main_list['mainlist'] = $this->Wedding_model->show_adminImg();
        $this->load->view('Admin/header');
        $this->load->view('Admin/show_Wedding', $main_list);
        $this->load->view('Admin/footer');
    }

    function adminchange_status($uadvid) {
        $status_result = $this->Wedding_model->adminchange_status($uadvid);
        if ($status_result) {
            $this->session->set_flashdata('success', 'Status Updated Successfully');
            redirect('WeddingController/show_Wedding');
        } else {
            $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
            redirect('WeddingController/show_Wedding');
        }
    }

    public function deleteWedding($id){
        $result = $this->db->delete('shiv_wedding',array('wedd_id' => $id));
          if ($result) {
            $this->session->set_flashdata('success', 'Image deleted Successfully');
            redirect('WeddingController/show_Wedding');
        } else {
            $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
            redirect('WeddingController/show_Wedding');
        }
    }

}

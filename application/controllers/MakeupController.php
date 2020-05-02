<?php

require_once './application/entity/MakeupEntity.php';

class MakeupController extends CI_Controller {

    var $MakeupEntity;

    public function __construct() {
        parent::__construct();
        $this->load->model('status_model');
        $this->load->model('Makeup_model');
        $this->MakeupEntity = new MakeupEntity();
    }

    function index() {
        $this->add_Makeup();
    }

    function add_Makeup() {
        $this->formgenerator->setColumns($this->MakeupEntity->getFormColumns());
        $this->formgenerator->setNames($this->MakeupEntity->getFormLabels());
        $status_list = $this->status_model->getStatus();
        $this->formgenerator->setDropDownValues(array('status' => $status_list));
        $row_form['form'] = $this->formgenerator->generate('makeup', TRUE);
           // print_r($row_form);die;
        $this->load->view('Admin/header');
        $this->load->view('Admin/add_Makeup',$row_form);
        $this->load->view('Admin/footer');
    }

    public function saveMakeup() {
        $this->form_validation->set_rules('makeup_image', 'Image Caption', array('required' => '%s should not be empty.'));
        $this->form_validation->set_rules('status_id', 'Status', 'trim|required', array('required' => '%s should not be empty.'));

        if (isset($_FILES["makeup_image"]["name"])) {
            if (!(is_dir('folder/makeup'))) {
                mkdir('./folder/makeup', 0777, true);
            } else {
                
            }
            $config['upload_path'] = './folder/makeup';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $this->load->library('upload', $config);
            $this->upload->initialize($config);
            if (!$this->upload->do_upload('makeup_image')) {
                echo $this->upload->display_errors();
            } else {
                $data = $this->upload->data();
                $config['image_library'] = 'gd2';
                $config['source_image'] = './folder/makeup' . $data["file_name"];
                $config['create_thumb'] = TRUE;
                $config['maintain_ratio'] = TRUE;
                $config['quality'] = '60%';
                $config['width'] = 200;
                $config['height'] = 200;
                $config['new_image'] = './folder/makeup' . $data["file_name"];
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
                $this->add_Makeup();
            } else {
                $this->add_Makeup();
            }
        } else {
            $post_data = $this->input->post();
            $result = $this->Makeup_model->saveaMain($post_data, $main_img['name']);
            if ($result) {
                $this->session->set_flashdata('success', 'Successfully Added.');
                redirect('MakeupController/show_Makeup');
            } else {
                $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
                redirect('MakeupController/add_Makeup');
            }
        }
    }

    function show_Makeup() {
        $main_list['mainlist'] = $this->Makeup_model->show_adminImg();
        $this->load->view('Admin/header');
        $this->load->view('Admin/show_Makeup', $main_list);
        $this->load->view('Admin/footer');
    }

    function adminchange_status($uadvid) {
        $status_result = $this->Makeup_model->adminchange_status($uadvid);
        if ($status_result) {
            $this->session->set_flashdata('success', 'Status Updated Successfully');
            redirect('MakeupController/show_Makeup');
        } else {
            $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
            redirect('MakeupController/show_Makeup');
        }
    }

    public function deleteMakeup($id){
        $result = $this->db->delete('shiv_makeup',array('makeup_id' => $id));
          if ($result) {
            $this->session->set_flashdata('success', 'Image deleted Successfully');
            redirect('MakeupController/show_Makeup');
        } else {
            $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
            redirect('MakeupController/show_Makeup');
        }
    }

}

<?php

require_once './application/entity/ModelingEntity.php';

class Modeling extends CI_Controller {

    var $ModelingEntity;

    public function __construct() {
        parent::__construct();
        $this->load->model('status_model');
        $this->load->model('Modeling_model');
        $this->ModelingEntity = new ModelingEntity();
    }

    function index() {
        $this->add_Modeling();
    }

    function add_Modeling() {
        $this->formgenerator->setColumns($this->ModelingEntity->getFormColumns());
        $this->formgenerator->setNames($this->ModelingEntity->getFormLabels());
        $status_list = $this->status_model->getStatus();
        $this->formgenerator->setDropDownValues(array('status' => $status_list));
        $row_form['form'] = $this->formgenerator->generate('modeling', TRUE);
        $this->load->view('Admin/header');
        $this->load->view('Admin/add_Modeling', $row_form);
        $this->load->view('Admin/footer');
    }

    public function saveMain() {
        $this->form_validation->set_rules('model_image', 'Image Caption', array('required' => '%s should not be empty.'));
        $this->form_validation->set_rules('status_id', 'Status', 'trim|required', array('required' => '%s should not be empty.'));

        if (isset($_FILES["model_image"]["name"])) {
            if (!(is_dir('folder/model'))) {
                mkdir('./folder/model', 0777, true);
            } else {
                
            }
            $config['upload_path'] = './folder/model';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $this->load->library('upload', $config);
            $this->upload->initialize($config);
            if (!$this->upload->do_upload('model_image')) {
                echo $this->upload->display_errors();
            } else {
                $data = $this->upload->data();
                $config['image_library'] = 'gd2';
                $config['source_image'] = './folder/model' . $data["file_name"];
                $config['create_thumb'] = TRUE;
                $config['maintain_ratio'] = TRUE;
                $config['quality'] = '60%';
                $config['width'] = 200;
                $config['height'] = 200;
                $config['new_image'] = './folder/model' . $data["file_name"];
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
                $this->add_Modeling();
            } else {
                $this->add_Modeling();
            }
        } else {
            $post_data = $this->input->post();
            $result = $this->Modeling_model->saveaMain($post_data, $main_img['name']);
            if ($result) {
                $this->session->set_flashdata('success', 'Successfully Added.');
                redirect('Modeling/show_Modeling');
            } else {
                $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
                redirect('Modeling/add_Modeling');
            }
        }
    }

    function show_Modeling() {
        $main_list['mainlist'] = $this->Modeling_model->show_adminImg();
        $this->load->view('Admin/header');
        $this->load->view('Admin/show_Modeling', $main_list);
        $this->load->view('Admin/footer');
    }

    function adminchange_status($uadvid) {
        $status_result = $this->Modeling_model->adminchange_status($uadvid);
        if ($status_result) {
            $this->session->set_flashdata('success', 'Status Updated Successfully');
            redirect('Modeling/show_Modeling');
        } else {
            $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
            redirect('Modeling/show_Modeling');
        }
    }


    public function deleteModelingl($id){
        $result = $this->db->delete('shiv_modeling',array('model_id' => $id));
          if ($result) {
             $this->session->set_flashdata('success', 'Image deleted Successfully');
            redirect('Modeling/show_Modeling');
        } else {
            $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
            redirect('Modeling/show_Modeling');
        }
    }

}

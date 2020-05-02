<?php

require_once './application/entity/MaternityEntity.php';

class Maternity extends CI_Controller {

    var $MaternityEntity;

    public function __construct() {
        parent::__construct();
        $this->load->model('status_model');
        $this->load->model('Maternity_model');
        $this->MaternityEntity = new MaternityEntity();
    }

    function index() {
        $this->add_Maternity();
    }

    function add_Maternity() {
        $this->formgenerator->setColumns($this->MaternityEntity->getFormColumns());
        $this->formgenerator->setNames($this->MaternityEntity->getFormLabels());
        $status_list = $this->status_model->getStatus();
        $this->formgenerator->setDropDownValues(array('status' => $status_list));
        $row_form['form'] = $this->formgenerator->generate('maternity', TRUE);
        $this->load->view('Admin/header');
        $this->load->view('Admin/add_Maternity', $row_form);
        $this->load->view('Admin/footer');
    }


    public function saveMaternity() {
        $this->form_validation->set_rules('maternity_image', 'Image', array('required' => '%s should not be empty.'));
        $this->form_validation->set_rules('status_id', 'Status', 'trim|required', array('required' => '%s should not be empty.'));

        if (isset($_FILES["maternity_image"]["name"])) {
            if (!(is_dir('folder/Maternity'))) {
                mkdir('./folder/Maternity', 0777, true);
            } else {
                
            }
            $config['upload_path'] = './folder/Maternity';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $this->load->library('upload', $config);
            $this->upload->initialize($config);
            if (!$this->upload->do_upload('maternity_image')) {
                echo $this->upload->display_errors();
            } else {
                $data = $this->upload->data();
                $config['image_library'] = 'gd2';
                $config['source_image'] = './folder/Maternity' . $data["file_name"];
                $config['create_thumb'] = TRUE;
                $config['maintain_ratio'] = TRUE;
                $config['quality'] = '60%';
                $config['width'] = 200;
                $config['height'] = 200;
                $config['new_image'] = './folder/Maternity' . $data["file_name"];
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
                $this->add_Maternity();
            } else {
                $this->add_Maternity();
            }
        } else {
            $post_data = $this->input->post();
            $result = $this->Maternity_model->saveMaternity($post_data, $main_img['name']);
            if ($result) {
                $this->session->set_flashdata('success', 'Successfully Added.');
                redirect('Maternity/show_Maternity');
            } else {
                $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
                redirect('Maternity/add_Maternity');
            }
        }
    }

     function show_Maternity() {
        $main_list['mainlist'] = $this->Maternity_model->show_adminImg();
        $this->load->view('Admin/header');
        $this->load->view('Admin/show_Maternity', $main_list);
        $this->load->view('Admin/footer');
    }

    function adminchange_status($uadvid) {
        $status_result = $this->Maternity_model->adminchange_status($uadvid);
        if ($status_result) {
            $this->session->set_flashdata('success', 'Status Updated Successfully');
            redirect('Maternity/show_Maternity');
        } else {
            $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
            redirect('Maternity/show_Maternity');
        }
    }

    public function deleteMaternity($id){
        $result = $this->db->delete('shiv_maternity',array('mat_id' => $id));
          if ($result) {
            $this->session->set_flashdata('success', 'Image deleted Successfully');
             redirect('Maternity/show_Maternity');
        } else {
            $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
            redirect('Maternity/show_Maternity');
        }
    }
}
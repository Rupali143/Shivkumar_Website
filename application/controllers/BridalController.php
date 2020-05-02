<?php

require_once './application/entity/BridalEntity.php';

class BridalController extends CI_Controller {

    var $BridalEntity;

    public function __construct() {
        parent::__construct();
        $this->load->model('status_model');
        $this->load->model('Bridal_model');
        $this->BridalEntity = new BridalEntity();
    }

    function index() {
        $this->add_Bridal();
    }

    function add_Bridal() {
        $this->formgenerator->setColumns($this->BridalEntity->getFormColumns());
        $this->formgenerator->setNames($this->BridalEntity->getFormLabels());
        $status_list = $this->status_model->getStatus();
        $this->formgenerator->setDropDownValues(array('status' => $status_list));
        $row_form['form'] = $this->formgenerator->generate('bridal', TRUE);
           // print_r($row_form);die;
        $this->load->view('Admin/header');
        $this->load->view('Admin/add_Bridal',$row_form);
        $this->load->view('Admin/footer');
    }

    public function saveBridal() {
        $this->form_validation->set_rules('bridal_image', 'Image Caption', array('required' => '%s should not be empty.'));
        $this->form_validation->set_rules('status_id', 'Status', 'trim|required', array('required' => '%s should not be empty.'));

        if (isset($_FILES["bridal_image"]["name"])) {
            if (!(is_dir('folder/bridal'))) {
                mkdir('./folder/bridal', 0777, true);
            } else {
                
            }
            $config['upload_path'] = './folder/bridal';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $this->load->library('upload', $config);
            $this->upload->initialize($config);
            if (!$this->upload->do_upload('bridal_image')) {
                echo $this->upload->display_errors();
            } else {
                $data = $this->upload->data();
                $config['image_library'] = 'gd2';
                $config['source_image'] = './folder/bridal' . $data["file_name"];
                $config['create_thumb'] = TRUE;
                $config['maintain_ratio'] = TRUE;
                $config['quality'] = '60%';
                $config['width'] = 200;
                $config['height'] = 200;
                $config['new_image'] = './folder/bridal' . $data["file_name"];
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
                $this->add_Bridal();
            } else {
                $this->add_Bridal();
            }
        } else {
            $post_data = $this->input->post();
            $result = $this->Bridal_model->saveaMain($post_data, $main_img['name']);
            if ($result) {
                $this->session->set_flashdata('success', 'Successfully Added.');
                redirect('BridalController/show_Bridal');
            } else {
                $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
                redirect('BridalController/add_Bridal');
            }
        }
    }

    function show_Bridal() {
        $main_list['mainlist'] = $this->Bridal_model->show_adminImg();
        $this->load->view('Admin/header');
        $this->load->view('Admin/show_Bridal', $main_list);
        $this->load->view('Admin/footer');
    }

    function adminchange_status($uadvid) {
        $status_result = $this->Bridal_model->adminchange_status($uadvid);
        if ($status_result) {
            $this->session->set_flashdata('success', 'Status Updated Successfully');
            redirect('BridalController/show_Bridal');
        } else {
            $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
            redirect('BridalController/show_Bridal');
        }
    }

    public function deleteBridal($id){
        $result = $this->db->delete('shiv_bridal',array('bridal_id' => $id));
          if ($result) {
            $this->session->set_flashdata('success', 'Image deleted Successfully');
            redirect('BridalController/show_Bridal');
        } else {
            $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
            redirect('BridalController/show_Bridal');
        }
    }

}

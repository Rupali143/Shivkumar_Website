<?php

require_once './application/entity/DestWeddingEntity.php';

class DestWeddingController extends CI_Controller {

    var $DestWeddingEntity;

    public function __construct() {
        parent::__construct();
        $this->load->model('status_model');
        $this->load->model('DestWedding_model');
        $this->DestWeddingEntity = new DestWeddingEntity();
    }

    function index() {
        $this->add_destWedding();
    }

    function add_destWedding() {
        $this->formgenerator->setColumns($this->DestWeddingEntity->getFormColumns());
        $this->formgenerator->setNames($this->DestWeddingEntity->getFormLabels());
        $status_list = $this->status_model->getStatus();
        $this->formgenerator->setDropDownValues(array('status' => $status_list));
        $row_form['form'] = $this->formgenerator->generate('destinationwedding', TRUE);
           // print_r($row_form);die;
        $this->load->view('Admin/header');
        $this->load->view('Admin/add_destWedding',$row_form);
        $this->load->view('Admin/footer');
    }

    public function savedestWedding() {
        $this->form_validation->set_rules('destination_image', 'Image Caption', array('required' => '%s should not be empty.'));
        $this->form_validation->set_rules('status_id', 'Status', 'trim|required', array('required' => '%s should not be empty.'));

        if (isset($_FILES["destination_image"]["name"])) {
            if (!(is_dir('folder/destiwedding'))) {
                mkdir('./folder/destiwedding', 0777, true);
            } else {
                
            }
            $config['upload_path'] = './folder/destiwedding';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $this->load->library('upload', $config);
            $this->upload->initialize($config);
            if (!$this->upload->do_upload('destination_image')) {
                echo $this->upload->display_errors();
            } else {
                $data = $this->upload->data();
                $config['image_library'] = 'gd2';
                $config['source_image'] = './folder/destiwedding' . $data["file_name"];
                $config['create_thumb'] = TRUE;
                $config['maintain_ratio'] = TRUE;
                $config['quality'] = '60%';
                $config['width'] = 200;
                $config['height'] = 200;
                $config['new_image'] = './folder/destiwedding' . $data["file_name"];
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
                $this->add_destWedding();
            } else {
                $this->add_destWedding();
            }
        } else {
            $post_data = $this->input->post();
            $result = $this->DestWedding_model->saveaMain($post_data, $main_img['name']);
            if ($result) {
                $this->session->set_flashdata('success', 'Successfully Added.');
                redirect('DestWeddingController/show_destWedding');
            } else {
                $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
                redirect('DestWeddingController/add_destWedding');
            }
        }
    }

    function show_destWedding() {
        $main_list['mainlist'] = $this->DestWedding_model->show_adminImg();
        $this->load->view('Admin/header');
        $this->load->view('Admin/show_destWedding', $main_list);
        $this->load->view('Admin/footer');
    }

    function adminchange_status($uadvid) {
        $status_result = $this->DestWedding_model->adminchange_status($uadvid);
        if ($status_result) {
            $this->session->set_flashdata('success', 'Status Updated Successfully');
            redirect('DestWeddingController/show_destWedding');
        } else {
            $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
            redirect('DestWeddingController/show_destWedding');
        }
    }

    public function deleteDestWedding($id){
        $result = $this->db->delete('shiv_destinationWedding',array('dest_id' => $id));
          if ($result) {
            $this->session->set_flashdata('success', 'Image deleted Successfully');
            redirect('DestWeddingController/show_destWedding');
        } else {
            $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
            redirect('DestWeddingController/show_destWedding');
        }
    }

}

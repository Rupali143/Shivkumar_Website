<?php

require_once './application/entity/PostWeddingEntity.php';

class PostWeddingController extends CI_Controller {

    var $PostWeddingEntity;

    public function __construct() {
        parent::__construct();
        $this->load->model('status_model');
        $this->load->model('PostWedding_model');
        $this->PostWeddingEntity = new PostWeddingEntity();
    }

    function index() {
        $this->add_PostWedding();
    }

    function add_PostWedding() {
        $this->formgenerator->setColumns($this->PostWeddingEntity->getFormColumns());
        $this->formgenerator->setNames($this->PostWeddingEntity->getFormLabels());
        $status_list = $this->status_model->getStatus();
        $this->formgenerator->setDropDownValues(array('status' => $status_list));
        $row_form['form'] = $this->formgenerator->generate('postwedding', TRUE);
           // print_r($row_form);die;
        $this->load->view('Admin/header');
        $this->load->view('Admin/add_PostWedding',$row_form);
        $this->load->view('Admin/footer');
    }

    public function savePostWedding() {
        $this->form_validation->set_rules('postWedding_image', 'Image Caption', array('required' => '%s should not be empty.'));
        $this->form_validation->set_rules('status_id', 'Status', 'trim|required', array('required' => '%s should not be empty.'));

        if (isset($_FILES["postWedding_image"]["name"])) {
            if (!(is_dir('folder/postWedding'))) {
                mkdir('./folder/postWedding', 0777, true);
            } else {
                
            }
            $config['upload_path'] = './folder/postWedding';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $this->load->library('upload', $config);
            $this->upload->initialize($config);
            if (!$this->upload->do_upload('postWedding_image')) {
                echo $this->upload->display_errors();
            } else {
                $data = $this->upload->data();
                $config['image_library'] = 'gd2';
                $config['source_image'] = './folder/postWedding' . $data["file_name"];
                $config['create_thumb'] = TRUE;
                $config['maintain_ratio'] = TRUE;
                $config['quality'] = '60%';
                $config['width'] = 200;
                $config['height'] = 200;
                $config['new_image'] = './folder/postWedding' . $data["file_name"];
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
                $this->add_PostWedding();
            } else {
                $this->add_PostWedding();
            }
        } else {
            $post_data = $this->input->post();
            $result = $this->PostWedding_model->saveaMain($post_data, $main_img['name']);
            if ($result) {
                $this->session->set_flashdata('success', 'Successfully Added.');
                redirect('PostWeddingController/show_PostWedding');
            } else {
                $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
                redirect('PostWeddingController/add_PostWedding');
            }
        }
    }

    function show_PostWedding() {
        $main_list['mainlist'] = $this->PostWedding_model->show_adminImg();
        $this->load->view('Admin/header');
        $this->load->view('Admin/show_PostWedding', $main_list);
        $this->load->view('Admin/footer');
    }

    function adminchange_status($uadvid) {
        $status_result = $this->PostWedding_model->adminchange_status($uadvid);
        if ($status_result) {
            $this->session->set_flashdata('success', 'Status Updated Successfully');
            redirect('PostWeddingController/show_PostWedding');
        } else {
            $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
            redirect('PostWeddingController/show_PostWedding');
        }
    }

    public function deletepostWedding($id){
        $result = $this->db->delete('shiv_postwedding',array('postWedding_id' => $id));
          if ($result) {
            $this->session->set_flashdata('success', 'Image deleted Successfully');
            redirect('PostWeddingController/show_PostWedding');
        } else {
            $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
            redirect('PostWeddingController/show_PostWedding');
        }
    }

}

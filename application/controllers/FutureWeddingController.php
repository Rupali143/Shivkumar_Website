<?php

require_once './application/entity/FutureWeddingEntity.php';

class FutureWeddingController extends CI_Controller {

    var $FutureWeddingEntity;

    public function __construct() {
        parent::__construct();
        $this->load->model('status_model');
        $this->load->model('FutureWedding_model');
        $this->FutureWeddingEntity = new FutureWeddingEntity();
    }

    function index() {
        $this->add_FutureWedding();
    }

    function add_FutureWedding() {
        $this->formgenerator->setColumns($this->FutureWeddingEntity->getFormColumns());
        $this->formgenerator->setNames($this->FutureWeddingEntity->getFormLabels());
        $status_list = $this->status_model->getStatus();
        $this->formgenerator->setDropDownValues(array('status' => $status_list));
        $row_form['form'] = $this->formgenerator->generate('futurewedding', TRUE);
           // print_r($row_form);die;
        $this->load->view('Admin/header');
        $this->load->view('Admin/add_FutureWedding',$row_form);
        $this->load->view('Admin/footer');
    }

    public function saveFutureWedding() {
        $this->form_validation->set_rules('futureWedding_image', 'Image Caption', array('required' => '%s should not be empty.'));
        $this->form_validation->set_rules('status_id', 'Status', 'trim|required', array('required' => '%s should not be empty.'));

        if (isset($_FILES["futureWedding_image"]["name"])) {
            if (!(is_dir('folder/futureWedding'))) {
                mkdir('./folder/futureWedding', 0777, true);
            } else {
                
            }
            $config['upload_path'] = './folder/futureWedding';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $this->load->library('upload', $config);
            $this->upload->initialize($config);
            if (!$this->upload->do_upload('futureWedding_image')) {
                echo $this->upload->display_errors();
            } else {
                $data = $this->upload->data();
                $config['image_library'] = 'gd2';
                $config['source_image'] = './folder/futureWedding' . $data["file_name"];
                $config['create_thumb'] = TRUE;
                $config['maintain_ratio'] = TRUE;
                $config['quality'] = '60%';
                $config['width'] = 200;
                $config['height'] = 200;
                $config['new_image'] = './folder/futureWedding' . $data["file_name"];
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
                $this->add_FutureWedding();
            } else {
                $this->add_FutureWedding();
            }
        } else {
            $post_data = $this->input->post();
            $result = $this->FutureWedding_model->saveaMain($post_data, $main_img['name']);
            if ($result) {
                $this->session->set_flashdata('success', 'Successfully Added.');
                redirect('FutureWeddingController/show_FutureWedding');
            } else {
                $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
                redirect('FutureWeddingController/add_FutureWedding');
            }
        }
    }

    function show_FutureWedding() {
        $main_list['mainlist'] = $this->FutureWedding_model->show_adminImg();
        $this->load->view('Admin/header');
        $this->load->view('Admin/show_FutureWedding', $main_list);
        $this->load->view('Admin/footer');
    }

    function adminchange_status($uadvid) {
        $status_result = $this->FutureWedding_model->adminchange_status($uadvid);
        if ($status_result) {
            $this->session->set_flashdata('success', 'Status Updated Successfully');
            redirect('FutureWeddingController/show_FutureWedding');
        } else {
            $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
            redirect('FutureWeddingController/show_FutureWedding');
        }
    }

    public function deleteFutureWedding($id){
        $result = $this->db->delete('shiv_futureWedding',array('futureWedding_id' => $id));
          if ($result) {
            $this->session->set_flashdata('success', 'Image deleted Successfully');
            redirect('FutureWeddingController/show_FutureWedding');
        } else {
            $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
            redirect('FutureWeddingController/show_FutureWedding');
        }
    }

}

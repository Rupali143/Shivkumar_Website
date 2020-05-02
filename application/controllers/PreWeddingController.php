<?php

require_once './application/entity/PreWeddingEntity.php';

class PreWeddingController extends CI_Controller {

    var $PreWeddingEntity;

    public function __construct() {
        parent::__construct();
        $this->load->model('status_model');
        $this->load->model('PreWedding_model');
        $this->PreWeddingEntity = new PreWeddingEntity();
    }

    function index() {
        $this->add_PreWedding();
    }

    function add_PreWedding() {
        $this->formgenerator->setColumns($this->PreWeddingEntity->getFormColumns());
        $this->formgenerator->setNames($this->PreWeddingEntity->getFormLabels());
        $status_list = $this->status_model->getStatus();
        $this->formgenerator->setDropDownValues(array('status' => $status_list));
        $row_form['form'] = $this->formgenerator->generate('prewedding', TRUE);
           // print_r($row_form);die;
        $this->load->view('Admin/header');
        $this->load->view('Admin/add_PreWedding',$row_form);
        $this->load->view('Admin/footer');
    }

    public function savePreWedding() {
        $this->form_validation->set_rules('preWedding_image', 'Image Caption', array('required' => '%s should not be empty.'));
        $this->form_validation->set_rules('status_id', 'Status', 'trim|required', array('required' => '%s should not be empty.'));

        if (isset($_FILES["preWedding_image"]["name"])) {
            if (!(is_dir('folder/preWedding'))) {
                mkdir('./folder/preWedding', 0777, true);
            } else {
                
            }
            $config['upload_path'] = './folder/preWedding';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $this->load->library('upload', $config);
            $this->upload->initialize($config);
            if (!$this->upload->do_upload('preWedding_image')) {
                echo $this->upload->display_errors();
            } else {
                $data = $this->upload->data();
                $config['image_library'] = 'gd2';
                $config['source_image'] = './folder/preWedding' . $data["file_name"];
                $config['create_thumb'] = TRUE;
                $config['maintain_ratio'] = TRUE;
                $config['quality'] = '60%';
                $config['width'] = 200;
                $config['height'] = 200;
                $config['new_image'] = './folder/preWedding' . $data["file_name"];
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
                $this->add_PreWedding();
            } else {
                $this->add_PreWedding();
            }
        } else {
            $post_data = $this->input->post();
            $result = $this->PreWedding_model->saveaMain($post_data, $main_img['name']);
            if ($result) {
                $this->session->set_flashdata('success', 'Successfully Added.');
                redirect('PreWeddingController/show_PreWedding');
            } else {
                $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
                redirect('PreWeddingController/add_PreWedding');
            }
        }
    }

    function show_PreWedding() {
        $main_list['mainlist'] = $this->PreWedding_model->show_adminImg();
        $this->load->view('Admin/header');
        $this->load->view('Admin/show_PreWedding', $main_list);
        $this->load->view('Admin/footer');
    }

    function adminchange_status($uadvid) {
        $status_result = $this->PreWedding_model->adminchange_status($uadvid);
        if ($status_result) {
            $this->session->set_flashdata('success', 'Status Updated Successfully');
            redirect('PreWeddingController/show_PreWedding');
        } else {
            $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
            redirect('PreWeddingController/show_PreWedding');
        }
    }

    public function deletePrewedding($id){
        $result = $this->db->delete('shiv_prewedding',array('preWedding_id' => $id));
          if ($result) {
            $this->session->set_flashdata('success', 'Image deleted Successfully');
            redirect('PreWeddingController/show_PreWedding');
        } else {
            $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
            redirect('PreWeddingController/show_PreWedding');
        }
    }

}

<?php

require_once './application/entity/AdvertisementEntity.php';

class Advertisement extends CI_Controller {

    var $AdvertisementEntity;

    public function __construct() {
        parent::__construct();
        $this->load->model('status_model');
        $this->load->model('Advertisement_model');
        $this->AdvertisementEntity = new AdvertisementEntity();
    }

    function index() {
        $this->add_MainCorousel();
    }

    function add_advertisement() {
        $this->formgenerator->setColumns($this->AdvertisementEntity->getFormColumns());
        $this->formgenerator->setNames($this->AdvertisementEntity->getFormLabels());
        $status_list = $this->status_model->getStatus();
        $this->formgenerator->setDropDownValues(array('status' => $status_list));
        $row_form['form'] = $this->formgenerator->generate('advertisement', TRUE);
        $this->load->view('Admin/header');
        $this->load->view('Admin/add_Advertisement',$row_form);
        $this->load->view('Admin/footer');
    }

    public function save_advertisement() {
        $this->form_validation->set_rules('advertise_image', 'Image Caption', array('required' => '%s should not be empty.'));
        $this->form_validation->set_rules('status_id', 'Status', 'trim|required', array('required' => '%s should not be empty.'));

        if (isset($_FILES["advertise_image"]["name"])) {
            if (!(is_dir('folder/Advertise'))) {
                mkdir('./folder/Advertise', 0777, true);
            } else {
                
            }
            $config['upload_path'] = './folder/Advertise';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $this->load->library('upload', $config);
            $this->upload->initialize($config);
            if (!$this->upload->do_upload('advertise_image')) {
                echo $this->upload->display_errors();
            } else {
                $data = $this->upload->data();
                $config['image_library'] = 'gd2';
                $config['source_image'] = './folder/Advertise' . $data["file_name"];
                $config['create_thumb'] = TRUE;
                $config['maintain_ratio'] = TRUE;
                $config['quality'] = '60%';
                $config['width'] = 200;
                $config['height'] = 200;
                $config['new_image'] = './folder/Advertise' . $data["file_name"];
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
                $this->add_advertisement();
            } else {
                $this->add_advertisement();
            }
        } else {
            $post_data = $this->input->post();
            $result = $this->Advertisement_model->saveAdvertise($post_data, $main_img['name']);
            if ($result) {
                $this->session->set_flashdata('success', 'Successfully Added.');
                redirect('Advertisement/show_advertisement');
            } else {
                $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
                redirect('Advertisement/add_advertisement');
            }
        }
    }

    function show_advertisement() {
        $main_list['mainlist'] = $this->Advertisement_model->show_advertisement();
        $this->load->view('Admin/header');
        $this->load->view('Admin/show_Advertisement', $main_list);
        $this->load->view('Admin/footer');
    }

    function adminchange_status($uadvid) {
        $status_result = $this->Advertisement_model->adminchange_status($uadvid);
        if ($status_result) {
            $this->session->set_flashdata('success', 'Status Updated Successfully');
            redirect('Advertisement/show_advertisement');
        } else {
            $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
            redirect('Advertisement/show_advertisement');
        }
    }

    public function deleteAdvertise($id){
        $result = $this->db->delete('shiv_advertisement',array('adv_id' => $id));
          if ($result) {
            $this->session->set_flashdata('success', 'Image deleted Successfully');
            redirect('Advertisement/show_advertisement');
        } else {
            $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
            redirect('Advertisement/show_advertisement');
        }
    }

}

<?php

require_once './application/entity/EngagementEntity.php';

class Engagement extends CI_Controller {

    var $EngagementEntity;

    public function __construct() {
        parent::__construct();
        $this->load->model('status_model');
        $this->load->model('Engagement_model');
        $this->EngagementEntity = new EngagementEntity();
    }

    function index() {
        $this->add_Engagement();
    }

    function add_Engagement() {
        $this->formgenerator->setColumns($this->EngagementEntity->getFormColumns());
        $this->formgenerator->setNames($this->EngagementEntity->getFormLabels());
        $status_list = $this->status_model->getStatus();
        $this->formgenerator->setDropDownValues(array('status' => $status_list));
        $row_form['form'] = $this->formgenerator->generate('engagement', TRUE);
        $this->load->view('Admin/header');
        $this->load->view('Admin/add_Engagement',$row_form);
        $this->load->view('Admin/footer');
    }

    public function saveEngagement() {
        $this->form_validation->set_rules('engagement_image', 'Image Caption', array('required' => '%s should not be empty.'));
        $this->form_validation->set_rules('status_id', 'Status', 'trim|required', array('required' => '%s should not be empty.'));

        if (isset($_FILES["engagement_image"]["name"])) {
            if (!(is_dir('folder/engagement'))) {
                mkdir('./folder/engagement', 0777, true);
            } else {
                
            }
            $config['upload_path'] = './folder/engagement';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $this->load->library('upload', $config);
            $this->upload->initialize($config);
            if (!$this->upload->do_upload('engagement_image')) {
                echo $this->upload->display_errors();
            } else {
                $data = $this->upload->data();
                $config['image_library'] = 'gd2';
                $config['source_image'] = './folder/engagement' . $data["file_name"];
                $config['create_thumb'] = TRUE;
                $config['maintain_ratio'] = TRUE;
                $config['quality'] = '60%';
                $config['width'] = 200;
                $config['height'] = 200;
                $config['new_image'] = './folder/engagement' . $data["file_name"];
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
                $this->add_Engagement();
            } else {
                $this->add_Engagement();
            }
        } else {
            $post_data = $this->input->post();
            // print_r($post_data);die;
            $result = $this->Engagement_model->saveaMain($post_data, $main_img['name']);
            if ($result) {
                $this->session->set_flashdata('success', 'Successfully Added.');
                redirect('Engagement/show_engagement');
            } else {
                $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
                redirect('Engagement/add_Engagement');
            }
        }
    }

    function show_engagement() {
        $main_list['mainlist'] = $this->Engagement_model->show_engagement();
        $this->load->view('Admin/header');
        $this->load->view('Admin/show_Engagement', $main_list);
        $this->load->view('Admin/footer');
    }

    function adminchange_status($uadvid) {
        $status_result = $this->Engagement_model->adminchange_status($uadvid);
        if ($status_result) {
            $this->session->set_flashdata('success', 'Status Updated Successfully');
            redirect('Engagement/show_engagement');
        } else {
            $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
            redirect('Engagement/show_engagement');
        }
    }

    public function deleteEngagement($id){
        $result = $this->db->delete('shiv_engagement',array('eng_id' => $id));
          if ($result) {
            $this->session->set_flashdata('success', 'Image deleted Successfully');
            redirect('Engagement/show_engagement');
        } else {
            $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
            redirect('Engagement/show_engagement');
        }
    }

}

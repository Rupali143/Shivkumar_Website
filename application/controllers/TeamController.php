<?php

require_once './application/entity/TeamEntity.php';

class TeamController extends CI_Controller {

    var $TeamEntity;

    public function __construct() {
        parent::__construct();
        $this->load->model('status_model');
        $this->load->model('Team_model');
        $this->TeamEntity = new TeamEntity();
    }

    function index() {
        $this->add_Team();
    }

    function add_Team() {
        $this->formgenerator->setColumns($this->TeamEntity->getFormColumns());
        $this->formgenerator->setNames($this->TeamEntity->getFormLabels());
        $status_list = $this->status_model->getStatus();
        $this->formgenerator->setDropDownValues(array('status' => $status_list));
        $row_form['form'] = $this->formgenerator->generate('team', TRUE);
           // print_r($row_form);die;
        $this->load->view('Admin/header');
        $this->load->view('Admin/add_Team',$row_form);
        $this->load->view('Admin/footer');
    }

    public function saveTeam() {
        $this->form_validation->set_rules('team_image', 'Image Caption', array('required' => '%s should not be empty.'));
        $this->form_validation->set_rules('status_id', 'Status', 'trim|required', array('required' => '%s should not be empty.'));

        if (isset($_FILES["team_image"]["name"])) {
            if (!(is_dir('folder/team'))) {
                mkdir('./folder/team', 0777, true);
            } else {
                
            }
            $config['upload_path'] = './folder/team';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $this->load->library('upload', $config);
            $this->upload->initialize($config);
            if (!$this->upload->do_upload('team_image')) {
                echo $this->upload->display_errors();
            } else {
                $data = $this->upload->data();
                $config['image_library'] = 'gd2';
                $config['source_image'] = './folder/team' . $data["file_name"];
                $config['create_thumb'] = TRUE;
                $config['maintain_ratio'] = TRUE;
                $config['quality'] = '60%';
                $config['width'] = 200;
                $config['height'] = 200;
                $config['new_image'] = './folder/team' . $data["file_name"];
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
                $this->add_Team();
            } else {
                $this->add_Team();
            }
        } else {
            $post_data = $this->input->post();
            $result = $this->Team_model->saveaMain($post_data, $main_img['name']);
            if ($result) {
                $this->session->set_flashdata('success', 'Successfully Added.');
                redirect('TeamController/show_Team');
            } else {
                $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
                redirect('TeamController/add_Team');
            }
        }
    }

    function show_Team() {
        $main_list['mainlist'] = $this->Team_model->show_adminImg();
        $this->load->view('Admin/header');
        $this->load->view('Admin/show_Team', $main_list);
        $this->load->view('Admin/footer');
    }

    function adminchange_status($uadvid) {
        $status_result = $this->Team_model->adminchange_status($uadvid);
        if ($status_result) {
            $this->session->set_flashdata('success', 'Status Updated Successfully');
            redirect('TeamController/show_Team');
        } else {
            $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
            redirect('TeamController/show_Team');
        }
    }

    public function deleteTeam($id){
        $result = $this->db->delete('shiv_team',array('team_id' => $id));
          if ($result) {
            $this->session->set_flashdata('success', 'Image deleted Successfully');
            redirect('TeamController/show_Team');
        } else {
            $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
            redirect('TeamController/show_Team');
        }
    }

}

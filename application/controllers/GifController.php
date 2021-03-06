<?php

require_once './application/entity/GifEntity.php';

class GifController extends CI_Controller {

    var $GifEntity;

    public function __construct() {
        parent::__construct();
        $this->load->model('status_model');
        $this->load->model('Gif_model');
        $this->GifEntity = new GifEntity();
    }

    function index() {
        $this->add_Gif();
    }

    function add_Gif() {
        $this->formgenerator->setColumns($this->GifEntity->getFormColumns());
        $this->formgenerator->setNames($this->GifEntity->getFormLabels());
        $status_list = $this->status_model->getStatus();
        $this->formgenerator->setDropDownValues(array('status' => $status_list));
        $row_form['form'] = $this->formgenerator->generate('gif', TRUE);
           // print_r($row_form);die;
        $this->load->view('Admin/header');
        $this->load->view('Admin/add_Gif',$row_form);
        $this->load->view('Admin/footer');
    }

    public function saveGif() {
        $this->form_validation->set_rules('gif_image', 'Image Caption', array('required' => '%s should not be empty.'));
        $this->form_validation->set_rules('status_id', 'Status', 'trim|required', array('required' => '%s should not be empty.'));

        if (isset($_FILES["gif_image"]["name"])) {
            if (!(is_dir('folder/gif'))) {
                mkdir('./folder/gif', 0777, true);
            } else {
                
            }
            $config['upload_path'] = './folder/gif';
            $config['allowed_types'] = 'gif|jpg|png|jpeg';
            $this->load->library('upload', $config);
            $this->upload->initialize($config);
            if (!$this->upload->do_upload('gif_image')) {
                echo $this->upload->display_errors();
            } else {
                $data = $this->upload->data();
                $config['image_library'] = 'gd2';
                $config['source_image'] = './folder/gif' . $data["file_name"];
                $config['create_thumb'] = TRUE;
                $config['maintain_ratio'] = TRUE;
                $config['quality'] = '60%';
                $config['width'] = 200;
                $config['height'] = 200;
                $config['new_image'] = './folder/gif' . $data["file_name"];
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
                $this->add_Gif();
            } else {
                $this->add_Gif();
            }
        } else {
            $post_data = $this->input->post();
            $result = $this->Gif_model->saveaMain($post_data, $main_img['name']);
            if ($result) {
                $this->session->set_flashdata('success', 'Successfully Added.');
                redirect('GifController/show_Gif');
            } else {
                $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
                redirect('GifController/add_Gif');
            }
        }
    }

    function show_Gif() {
        $main_list['mainlist'] = $this->Gif_model->show_adminImg();
        $this->load->view('Admin/header');
        $this->load->view('Admin/show_Gif', $main_list);
        $this->load->view('Admin/footer');
    }

    function adminchange_status($uadvid) {
        $status_result = $this->Gif_model->adminchange_status($uadvid);
        if ($status_result) {
            $this->session->set_flashdata('success', 'Status Updated Successfully');
            redirect('GifController/show_Gif');
        } else {
            $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
            redirect('GifController/show_Gif');
        }
    }

    public function deleteGif($id){
        $result = $this->db->delete('shiv_gif',array('gif_id' => $id));
          if ($result) {
            $this->session->set_flashdata('success', 'Image deleted Successfully');
            redirect('GifController/show_Gif');
        } else {
            $this->session->set_flashdata('error', 'Opps!!Something went wrong.');
            redirect('GifController/show_Gif');
        }
    }

}

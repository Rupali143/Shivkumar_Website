<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class FormGenerator {

    var $form_data = array();

    function __construct() {
        $this->CI = & get_instance();
    }

    function setColumns($value) {
        $this->form_data['columns'] = $value;
    }

    function getUserColumns() {
        return $this->form_data['columns'];
    }

    function setNames($value) {
        $this->form_data['names'] = $value;
    }

    function setDropDownValues($value) {
        $this->form_data['dropdown'] = $value;
    }

    function setCheckBoxValues($value) {
        $this->form_data['checkbox'] = $value;
    }

    function generate($type, $validation = FALSE, $formdata = NULL) {
        $columns = '';
        $display_names = '';
        $columns = $this->getColumns($type);
        if ($type == "package_seeker" || $type == "categories" || $type =="modeling" || $type == "maternity" || $type =="advertisement" || $type="engagement" || $type == "gif" || $type == "wedding" || $type == "destinationwedding" || $type=="bridal" || $type =="prewedding" ||$type =="postwedding" || $type== "makeup" || $type=="futurewedding" || $type == "team")
            $form = $this->createMultfieldsForm($columns, $validation, $formdata);
        else
            $form = $this->createForm($columns, $validation, $formdata);
        return $form;
    }

    function getColumns($type) {
        $col = array();
        $array = array();
        if ($type == "categories" || $type =="modeling" ||  $type == "team" || $type == "gif" ||  $type == "maternity" || $type =="advertisement"|| $type=="engagement" || $type == "wedding" || $type == "destinationwedding" || $type=="bridal" || $type== "makeup" || 
            $type =="prewedding" || $type =="postwedding" || $type=="futurewedding") {
            $query = "SELECT column_name as Field, data_type as Type FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = " . "'shiv_" . $type . "'";
        } else {
            $query = "SELECT column_name as Field, data_type as Type FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = " . "'shiv_" . $type . "'";
        }
        $result = $this->CI->db->query($query);
        $res = $result->result_array();

        foreach ($res as $row) {
            $col['Field'][] = $row['Field'];
            $col['Type'][] = $row['Type'];
            $col;
        }
        return $col;
    }

    function createForm($db_columns, $validation = FALSE, $formdata = NULL) {

        $elements = '';
        $elements1 = '';
        $columns = $this->form_data['columns'];
        $blog = "";
        $guest = "";
        if ($formdata == "blog") {
            $formdata = NULL;
            $blog = "blog";
        }
        if ($formdata == "guest") {
            $formdata = NULL;
            $guest = "guest";
        }

        if (!empty($columns)) {
            foreach ($db_columns['Field'] as $key => $value) {
                foreach ($columns as $key1 => $val) {
                    if ($db_columns['Field'][$key] == $val) {
                        if ($db_columns['Type'][$key] == 'int') {
                            $input_type = "text";
                        }
                        if ($db_columns['Type'][$key] == 'float') {
                            $input_type = "text";
                        }
                        if ($db_columns['Type'][$key] == 'varchar') {
                            $input_type = "text";
                        }
                        if ($db_columns['Type'][$key] == 'time') {
                            $input_type = "time";
                        }
                        if ($db_columns['Type'][$key] == 'text') {
                            $input_type = "textarea";
                        }
                        if ($db_columns['Type'][$key] == 'blob') {
                            $input_type = "file";
                        }

                        if ($db_columns['Field'][$key] == 'apk_rdescription') {
                            $input_type = "textarea";
                        }
                        if ($db_columns['Field'][$key] == 'apk_cdescription') {
                            $input_type = "textarea";
                        }
                        if ($db_columns['Field'][$key] == 'country_id') {
                            $input_type = "dropdown";
                            $dropdown = $this->form_data['dropdown']['country'];
                        }
                        if ($db_columns['Field'][$key] == 'country_id') {
                            $input_type = "dropdown";
                            $dropdown = $this->form_data['dropdown']['country'];
                        }
                        if ($db_columns['Field'][$key] == 'state_id') {
                            $input_type = "dropdown";
                            $dropdown = $this->form_data['dropdown']['state'];
                        }
                        if ($db_columns['Field'][$key] == 'city_id') {
                            $input_type = "dropdown";
                            $dropdown = $this->form_data['dropdown']['city'];
                        }
                        if ($db_columns['Field'][$key] == 'area_id') {
                            $input_type = "dropdown";
                            $dropdown = $this->form_data['dropdown']['area'];
                        }
                        if ($db_columns['Field'][$key] == 'category_id') {
                            $input_type = "dropdown";
                            $dropdown = $this->form_data['dropdown']['category'];
                        }
                        if ($db_columns['Field'][$key] == 'type_id') {
                            $input_type = "dropdown";
                            $dropdown = $this->form_data['dropdown']['type'];
                        }
                        if ($db_columns['Field'][$key] == 'status_id') {
                            $input_type = "dropdown";
                            $dropdown = $this->form_data['dropdown']['status'];
                        }
                        if ($db_columns['Field'][$key] == 'course_id') {
                            $input_type = "dropdown";
                            $dropdown = $this->form_data['dropdown']['course'];
                        }
                        if ($db_columns['Field'][$key] == 'cl_id') {
                            $input_type = "dropdown";
                            $dropdown = $this->form_data['dropdown']['client'];
                        }


                        // CMS Fields Start
//                        if ($db_columns['Field'][$key] == 'cms_id') {
//                            $input_type = "dropdown";
//                            $dropdown = $this->form_data['dropdown']['parent'];
//                        }
                        if ($db_columns['Field'][$key] == 'content') {
                            $input_type = "editor";
                        }


                        if ($db_columns['Field'][$key] == 'image') {
                            $input_type = "file";
                            //$foldername = 'cms';
                        }

                        // Form Time Timing Field
                        if ($db_columns['Field'][$key] == 'tm_from_time') {
                            $input_type = "time";
                        }
                        //
                        // To Time Timing Field
                        if ($db_columns['Field'][$key] == 'tm_to_time') {
                            $input_type = "time";
                        }

                        if ($db_columns['Field'][$key] == "oth_card") {
                            $input_type = "radio";
                            $radioarr = unserialize(CARDS);
                        }
                        if ($db_columns['Field'][$key] == "oth_pets") {
                            $input_type = "radio";
                            $radioarr = unserialize(CARDS);
                        }
                        if ($db_columns['Field'][$key] == "oth_park") {
                            $input_type = "radio";
                            $radioarr = unserialize(CARDS);
                        }
                        if ($db_columns['Field'][$key] == "oth_smoke") {
                            $input_type = "radio";
                            $radioarr = unserialize(CARDS);
                        }
                        if ($db_columns['Field'][$key] == "oth_wchair") {
                            $input_type = "radio";
                            $radioarr = unserialize(CARDS);
                        }
                        if ($db_columns['Field'][$key] == "oth_special") {
                            $input_type = "radio";
                            $radioarr = unserialize(CARDS);
                        }
                        if ($db_columns['Field'][$key] == "oth_internet") {
                            $input_type = "radio";
                            $radioarr = unserialize(CARDS);
                        }
                        //
                        // CMS Ends
//                        if ($db_columns['Field'][$key] == 'parent_id') {
//                            $input_type = "dropdownmultiplelist";
//                            $dropdown = $this->form_data['dropdown']['parent'];
//                        }
                        // Entries Fields Starts
//                        if ($db_columns['Field'][$key] == 'title') {
//                            $input_type = "text";
//                        }
//                        if ($db_columns['Field'][$key] == 'slug') {
//                            $input_type = "text";
//                        }
                        if ($db_columns['Field'][$key] == 'img') {
                            $input_type = "file";
                        }

                        if ($db_columns['Field'][$key] == 'vdo') {
                            $input_type = "video";
                        }
                        if ($db_columns['Field'][$key] == 'contentdesc') {
                            $input_type = "editor";
                        }

                        if (empty($blog)) {
                            if ($db_columns['Field'][$key] == 'created_date') {
                                $input_type = "datetimepicker";
                            }
                        }

                        // Entries Ends
                        // Social Admin Fields Start
                        //     if ($db_columns['Field'][$key] == 'soc_img') {
                        //     $input_type = "file";
                        // }

                        if ($db_columns['Field'][$key] == 'soc_med_name') {
                            $input_type = "text";
                        }

                        if ($db_columns['Field'][$key] == 'soc_med_url') {
                            $input_type = "text";
                        }
                        // Social Admin Fields Ends
                        //Header Admin Fields Start
                        if ($db_columns['Field'][$key] == 'head_logo') {
                            $input_type = "file";
                        }
                        // Header Admin Fields End
                        //Banner Admin Field Start
                        if ($db_columns['Field'][$key] == 'ban_img') {
                            $input_type = "file";
                        }
                        if ($db_columns['Field'][$key] == 'ban_capt') {
                            $input_type = "text";
                        }
                        //Advertisement Admin Field Start
                        if ($db_columns['Field'][$key] == 'adv_img') {
                            $input_type = "file";
                        }
                        if ($db_columns['Field'][$key] == 'adv_capt') {
                            $input_type = "text";
                        }
                        //Banner Admin Field End 
                        //HomePageContent Fields Starts
                        if ($db_columns['Field'][$key] == 'labelone') {
                            $input_type = "editor";
                        }

                        if ($db_columns['Field'][$key] == 'labeltwo') {
                            $input_type = "editor";
                        }

                        if ($db_columns['Field'][$key] == 'labelthree') {
                            $input_type = "editor";
                        }

                        //HomePageContent Fields Ends 



                        if ($db_columns['Field'][$key] == 'cat_id') {
                            $input_type = "dropdown";
                            $dropdown = $this->form_data['dropdown']['parent'];
                        }
                        if ($db_columns['Field'][$key] == 'subcat_id') {
                            $input_type = "dropdown";
                            $dropdown = $this->form_data['dropdown']['parentsub'];
                        }
                        if ($db_columns['Field'][$key] == 'service_id') {
                            $input_type = "dropdown";
                            $dropdown = $this->form_data['dropdown']['services'];
                        }
//                        if ($db_columns['Field'][$key] == 'carpet_unit_id') {
//                            $input_type = "dropdown";
//                            $dropdown = $this->form_data['dropdown']['unit'];
//                        }
//                        if ($db_columns['Field'][$key] == "prop_lookingfor") {
//                            $input_type = "radio";
//                            $radioarr = unserialize(LOOKINGFOR);
//                        }
//                        if ($db_columns['Field'][$key] == 'domain_id') {
//                            $input_type = "dropdown";
//                            $dropdown = $this->form_data['dropdown']['domain'];
//                        }
                        if ($db_columns['Field'][$key] == 'tm_from_day') {
                            $input_type = "dropdownconst";
                            $dropdownconst = unserialize(DAYS);
                        }
                        if ($db_columns['Field'][$key] == 'tm_to_day') {
                            $input_type = "dropdownconst";
                            $dropdownconst = unserialize(DAYS);
                        }
//                        if ($db_columns['Field'][$key] == "prop_furnishing") {
//                            $input_type = "radio";
//                            $radioarr = unserialize(FURNISHING);
//                        }
//                        if ($db_columns['Field'][$key] == "prop_ownership") {
//                            $input_type = "radio";
//                            $radioarr = unserialize(OWNERSHIP);
//                        }
//                        if ($db_columns['Field'][$key] == "prop_avalibility") {
//                            $input_type = "radio";
//                            $radioarr = unserialize(AVALIBILITY);
//                        }
//                        if ($db_columns['Field'][$key] == "prop_facing") {
//                            $input_type = "dropdownconst";
//                            $dropdownconst = unserialize(FACING);
//                        }
                        if ($db_columns['Field'][$key] == 'cat_icon') {
                            $input_type = "file";
                            $foldername = 'category';
                        }
                        if ($db_columns['Field'][$key] == 'amenity_icon') {
                            $input_type = "file";
                            $foldername = 'amenity';
                        }


                        if ($input_type == "datetimepicker") {
                            if ($validation) {
                                if (form_error($this->form_data['columns'][$key1])) {
                                    $elements .= " <div class='alert alert-danger'>      
                            <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>"
                                            . form_error($this->form_data['columns'][$key1]) . " 
                            </div>";
                                }
                            }
                            if (empty($formdata)) {
                                $setValue = "2017-01-01 00:00";
                            } else {
                                $setValue = $formdata[$this->form_data['columns'][$key1]];
                            }
                            $elements .= '<div class="clearfix"></div><div class="form-group">
						    <label for="">' . $this->form_data['names'][$key1] . ':</label><span id="' . $this->form_data['columns'][$key1] . '1"></span>
						      
                                                       
                                                           <input type="text" class="form-control form_datetime valid" readonly="" id="created_date" name="created_date" value="' . $setValue . '">
                                                           
                                                      
	  					</div>';
                        }


                        if ($input_type == "text") {
                            if ($validation) {
                                if (form_error($this->form_data['columns'][$key1])) {
                                    $elements .= " <div class='alert alert-danger'>      
                            <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>"
                                            . form_error($this->form_data['columns'][$key1]) . " 
                            </div>";
                                }
                            }
                            if (empty($formdata)) {
                                $setValue = set_value($this->form_data['columns'][$key1]);
                            } else {
                                $setValue = $formdata[$this->form_data['columns'][$key1]];
                            }
                            $elements .= '<div class="clearfix"></div><div class="form-group">
						    <label for="">' . $this->form_data['names'][$key1] . ':</label><span id="' . $this->form_data['columns'][$key1] . '1"></span>
						      <input type="text" class="form-control" id="' . $this->form_data['columns'][$key1] . '"  name="' . $this->form_data['columns'][$key1] . '" value="' . $setValue . '">
	  					</div>';
                        }//if
                        if ($input_type == "textarea") {
                            if ($validation) {
                                if (form_error($this->form_data['columns'][$key1])) {
                                    $elements .= " <div class='alert alert-danger'>      
                           <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>"
                                            . form_error($this->form_data['columns'][$key1]) . "
                           </div>";
                                }
                            }
                            if (empty($formdata)) {
                                $setValue = set_value($this->form_data['columns'][$key1]);
                            } else {
                                $setValue = $formdata[$this->form_data['columns'][$key1]];
                            }
                            $elements .= '<div class="form-group">
   <label for="">' . $this->form_data['names'][$key1] . ':</label>
     <textarea class="form-control" id="' . $this->form_data['columns'][$key1] . '"  name="' . $this->form_data['columns'][$key1] . '">' . $setValue . '</textarea>
  </div>';
                        }//if
                        if ($input_type == "file") {
                            if ($validation) {
                                if (form_error($this->form_data['columns'][$key1])) {
                                    $elements1 .= "<div class='alert alert-danger'>      
                            <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>"
                                            . form_error($this->form_data['columns'][$key1]) . " 
                            </div>";
                                }
                            }

                            if (empty($formdata)) {
                                $setValue = set_value($this->form_data['columns'][$key1]);
                                $elements .= '<div class="form-group">
                                 ' . $elements1 . '<label for="">' . $this->form_data['names'][$key1] . ':</label><span id="' . $this->form_data['columns'][$key1] .
                                        '1"></span>
                                                        <input type="file" class="form-control" id="' . $this->form_data['columns'][$key1] . '"  name="' . $this->form_data['columns'][$key1] . '" value="' . $setValue . '">
                                               </div>';
                            } else {
                                $formimage = $formdata[$this->form_data['columns'][$key1]];
//                                echo $formimage;
//                                die();
                                if ($formimage == "") {
                                    $imageicon = '<img src="../../images/noimage.png" width="50" height="50">';
                                } else {
                                    $this->CI = & get_instance();
                                    $pathid = $this->CI->uri->segment(3);
                                    $url = $formimage;
                                    $imageicon = '<img src="' . base_url() . $url . '" width="50" height="50">';
                                }
                                $elements .= '<div class="form-group">
                                 ' . $elements1 . '<label for="">' . $this->form_data['names'][$key1] . ':</label><span id="' . $this->form_data['columns'][$key1] .
                                        '1"></span><br>'
                                        . $imageicon
                                        . '<input type="hidden" name="old_' . $this->form_data['columns'][$key1] . '" value="' . $formimage . '">'
                                        . '<input type="file" class="form-control" id="' . $this->form_data['columns'][$key1] . '"  name="' . $this->form_data
                                        ['columns'][$key1] . '">'
                                        . '</div>';
                            }
                            //$inputFields[$this->form_data['columns'][$key1]] = $elements;
                        }//if
                        if ($input_type == "video") {
                            if ($validation) {
                                if (form_error($this->form_data['columns'][$key1])) {
                                    $elements1 .= "<div class='alert alert-danger'>      
                            <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>"
                                            . form_error($this->form_data['columns'][$key1]) . " 
                            </div>";
                                }
                            }

                            if (empty($formdata)) {
                                $setValue = set_value($this->form_data['columns'][$key1]);
                                $elements .= '<div class="form-group">
                                 ' . $elements1 . '<label for="">' . $this->form_data['names'][$key1] . ':</label><span id="' . $this->form_data['columns'][$key1] .
                                        '1"></span>
                                                        <input type="file" class="form-control" id="' . $this->form_data['columns'][$key1] . '"  name="' . $this->form_data['columns'][$key1] . '" value="' . $setValue . '">
                                               </div>';
                            } else {
                                $formimage = $formdata[$this->form_data['columns'][$key1]];
//                                echo $formimage;
//                                die();
                                if ($formimage == "") {
                                    $imageicon = '<img src="../../images/noimage.png" width="50" height="50">';
                                } else {
                                    $this->CI = & get_instance();
                                    $pathid = $this->CI->uri->segment(3);
                                    $url = $formimage;
                                    $imageicon = '<img src="' . base_url() . $url . '" width="50" height="50">';
                                }
                                $elements .= '<div class="form-group">
                                 ' . $elements1 . '<label for="">' . $this->form_data['names'][$key1] . ':</label><span id="' . $this->form_data['columns'][$key1] .
                                        '1"></span><br>'
                                        . $imageicon
                                        . '<video width="50" height="50" controls>
				  	<source src="' . base_url() . $formimage . '" type="video/mp4">  
					</video>'
//                                        . '<input type="hidden" name="old_' . $this->form_data['columns'][$key1] . '" value="' . $formimage . '">'
                                        . '<input type="file" class="form-control" id="' . $this->form_data['columns'][$key1] . '"  name="' . $this->form_data
                                        ['columns'][$key1] . '">'
                                        . '</div>';
                            }
                            //$inputFields[$this->form_data['columns'][$key1]] = $elements;
                        }//if
                        if ($input_type == "radio") {
                            if ($validation) {
                                if (form_error($this->form_data['columns'][$key1])) {
                                    $elements .= " <div class='alert alert-danger'>      
                            <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>"
                                            . form_error($this->form_data['columns'][$key1]) . " 
                            </div>";
                                }
                            }
                            $name = $this->form_data['columns'][$key1];
                            $elements .= '<div class="form-group">
						    <label for="">' . $this->form_data['names'][$key1] . ':</label><br />';
                            foreach ($radioarr as $key2 => $value1) {
                                $radid = $name . '_' . $value1;
                                $setradio = set_checkbox($this->form_data['columns'][$key1], $value1);
                                $elements .= '<input type="radio" value=' . $value1 . ' id="' . $radid . '"  name="' . $this->form_data['columns'][$key1] . '" ' . $setradio . '>'
                                        . '&nbsp<label for="' . $radid . '">' . $key2 . '</label>&nbsp&nbsp&nbsp&nbsp';
                            }
                            $elements .= '</div>';
                        }//if
                        if ($input_type == "dropdown") {
                            if (empty($guest)) {
                                if ($validation) {
                                    if (form_error($this->form_data['columns'][$key1])) {
                                        $elements .= " <div class='alert alert-danger'>      
                            <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>"
                                                . form_error($this->form_data['columns'][$key1]) . " 
                            </div>";
                                    }
                                }
                                $elements .= '<div class="clearfix"></div><div class="form-group">
				           <label for="">' . $this->form_data['names'][$key1] . ':</label><span id="' . $this->form_data['columns'][$key1] . '1"></span>
					   <select class="form-control" id="' . $this->form_data['columns'][$key1] . '"  name="' . $this->form_data['columns'][$key1] . '">
                                           <option value="">--Select--</option>';
                                foreach ($dropdown as $key2 => $value1) {
                                    $arrkey = array_keys($value1);
                                    $paramaid = $arrkey[0];
                                    $paramaname = $arrkey[1];
                                    if (empty($formdata)) {
                                        $setselect = set_select($this->form_data['columns'][$key1], $dropdown[$key2][$paramaid]);
                                    } else {
                                        $selectval = $formdata[$this->form_data['columns'][$key1]];
                                        if ($dropdown[$key2][$paramaid] == $selectval)
                                            $setselect = ' selected="selected"';
                                        else
                                            $setselect = '';
                                    }

                                    $elements .= '<option value="' . $dropdown[$key2][$paramaid] . '"' . $setselect . '>' . $dropdown[$key2][$paramaname] . '</option>';
                                }
                                $elements .= '</select>
                            </div>';
                            }
                        }//if
//                        if ($input_type == "dropdownmultiplelist") {
//                            if ($validation) {
//                                if (form_error($this->form_data['columns'][$key1])) {
//                                    $elements.=" <div class='alert alert-danger'>      
//                            <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>"
//                                            . form_error($this->form_data['columns'][$key1]) . " 
//                            </div>";
//                                }
//                            }
//                            $elements.='<div class="form-group">
//				           <label for="">' . $this->form_data['names'][$key1] . ':</label>
//					   <select class="form-control" id="' . $this->form_data['columns'][$key1] . '"  name="' . $this->form_data['columns'][$key1] . '">
//                                           <option value="">--Select--</option>';
//                            foreach ($dropdown as $key2 => $value1) {
//                                $arrkey = array_keys($value1);
//                                $paramaid = $arrkey[0];
//                                $paramaname = $arrkey[1];
//                                if (empty($formdata)) {
//                                    $setselect = set_select($this->form_data['columns'][$key1], $dropdown[$key2][$paramaid]);
//                                } else {
//                                    $selectval = $formdata[$this->form_data['columns'][$key1]];
//                                    if ($dropdown[$key2][$paramaid] == $selectval)
//                                        $setselect = ' selected="selected"';
//                                    else
//                                        $setselect = '';
//                                }
//
////                                $elements.='<option value="' . $dropdown[$key2][$paramaid] . '"' . $setselect . '>' . $dropdown[$key2][$paramaname] . '</option>';
//                            }
//                            $this->cat_list();
//                            $elements.= '</select>
//                            </div>';
//                        }
                        if ($input_type == "editor") {
                            if ($validation) {
                                if (form_error($this->form_data['columns'][$key1])) {
                                    $elements1 .= "<div class='alert alert-danger'>      
                            <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>"
                                            . form_error($this->form_data['columns'][$key1]) . " 
                            </div>";
                                }
                            }
                            if (empty($formdata)) {
                                $setValue = set_value($this->form_data['columns'][$key1]);
                            } else {
                                $setValue = $formdata[$this->form_data['columns'][$key1]];
                            }
                            $elements .= '<div class="col-md-12"><div class="form-group">
                                 ' . $elements1 . '
						    <label for="">' . $this->form_data['names'][$key1] . ':</label>
						      <textarea class="form-control" id="' . $this->form_data['columns'][$key1] . '"  name="' . $this->form_data['columns'][$key1] . '">' . $setValue . '</textarea>
                                               </div></div><div class="clearfix"></div>';
                            $inputFields[$this->form_data['columns'][$key1]] = $elements;
                        }
                        if ($input_type == "time") {
                            if ($validation) {
                                if (form_error($this->form_data['columns'][$key1])) {
                                    $elements .= " <div class='alert alert-danger'>      
                            <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>"
                                            . form_error($this->form_data['columns'][$key1]) . " 
                            </div>";
                                }
                            }
                            if (empty($formdata)) {
                                $setValue = set_value($this->form_data['columns'][$key1]);
                            } else {
                                $setValue = $formdata[$this->form_data['columns'][$key1]];
                            }
                            $elements .= '<div class="bootstrap-timepicker">
                                    <div class="form-group">
                                        <label>' . $this->form_data['names'][$key1] . ':</label>

                                        <div class="input-group">
                                            <input type="text" class="form-control timepicker" id="' . $this->form_data['columns'][$key1] . '"  name="' . $this->form_data['columns'][$key1] . '" value="' . $setValue . '">

                                            <div class="input-group-addon">
                                                <i class="fa fa-clock-o"></i>
                                            </div>
                                        </div>                                       
                                    </div>
                                </div>';
                        }//if
                        if ($input_type == "dropdownconst") {
                            if ($validation) {
                                if (form_error($this->form_data['columns'][$key1])) {
                                    $elements .= " <div class='alert alert-danger'>      
                            <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>"
                                            . form_error($this->form_data['columns'][$key1]) . " 
                            </div>";
                                }
                            }
                            $elements .= '<div class="form-group">
				           <label for="">' . $this->form_data['names'][$key1] . ':</label><span id="' . $this->form_data['columns'][$key1] . '1"></span>
					   <select class="form-control" id="' . $this->form_data['columns'][$key1] . '"  name="' . $this->form_data['columns'][$key1] . '">
                                           <option value="">--Select--</option>';

                            foreach ($dropdownconst as $key2 => $value1) {
                                $setselect = set_select($this->form_data['columns'][$key1], $formdata['tm_to_day']);
                                if (empty($formdata)) {
                                    $setselect = set_select($this->form_data['columns'][$key1], $value1);
                                } else {
                                    $selectval = $formdata[$this->form_data['columns'][$key1]];
                                    if ($value1 == $selectval)
                                        $setselect = ' selected="selected"';
                                    else
                                        $setselect = '';
                                }
                                $elements .= '<option value="' . $value1 . '" ' . $setselect . '>' . $key2 . '</option>';
                            }
                            $elements .= '</select>
                            </div>';
                        }
                        $input_type = '';
                    }//if
                }//for
            }//for
        }//if

        return $elements;
    }

    function createMultfieldsForm($db_columns, $validation = FALSE, $formdata = NULL) {
        $elements = '';
        $elements1 = '';
        $elementstext = '';
        $inputFields = array();
        $columns = $this->form_data['columns'];

        $isText = false;
        $readonly = "";
//        echo "<pre>";print_r($db_columns);
//        die();
        $guest = "";
        $guest_images = "";
        if ($formdata == "guest") {
            $formdata = NULL;
            $guest = "guest";
        }
        if (isset($formdata["guest_image"])) {
            //$formdata = NULL;
            $guest_images = "guest_image";
        }
        $editview = "";
//        echo "<pre>";print_r($guest_images);
//        die();
        if ($formdata) {
            $guest = $formdata;
        }
        if (isset($formdata['business_edit'])) {
            $editview = "business_edit";
        }
        if (isset($formdata['username_edit'])) {
            $readonly = "readonly";
        }

        if (!empty($columns)) {
            foreach ($db_columns['Field'] as $key => $value) {
                foreach ($columns as $key1 => $val) {
                    $elements = '';
                    $elements1 = '';
                    $elementstext = '';
                    if ($db_columns['Field'][$key] == $val) {
                        if ($db_columns['Type'][$key] == 'int') {
                            $input_type = "text";
                        }
                        if ($db_columns['Type'][$key] == 'float') {
                            $input_type = "text";
                        }
                        if ($db_columns['Type'][$key] == 'time') {
                            $input_type = "time";
                        }
                        if ($db_columns['Type'][$key] == 'varchar') {
                            $input_type = "text";
                            $isText = true;
                        }
                        if ($db_columns['Type'][$key] == 'text') {
                            $input_type = "textarea";
                        }
                        if ($db_columns['Field'][$key] == 'pk_description') {
                            $input_type = "textarea";
                        }
                        if ($db_columns['Field'][$key] == 'apk_rdescription') {
                            $input_type = "textarea";
                        }
                        if ($db_columns['Field'][$key] == 'apk_cdescription') {
                            $input_type = "textarea";
                        }
                        if ($db_columns['Type'][$key] == 'blob') {
                            $input_type = "file";
                        }

                        if ($db_columns['Type'][$key] == 'bigint') {
                            $input_type = "text";
                        }
                        if ($db_columns['Type'][$key] == 'Date') {
                            $input_type = "textdate";
                        }
                        if ($db_columns['Field'][$key] == 'country_id') {
                            $input_type = "dropdown";
                            $dropdown = $this->form_data['dropdown']['country'];
                        }
                        if ($db_columns['Field'][$key] == 'state_id') {
                            $input_type = "dropdown";
                            $dropdown = $this->form_data['dropdown']['state'];
                        }

                        if ($db_columns['Field'][$key] == 'alt_where') {
                            $input_type = "dropdownconst";
                            $dropdownconst = unserialize(ALTDISPLAYMODE);
                        }
                        if ($db_columns['Field'][$key] == 'pk_partofpayment') {
                            $input_type = "dropdownconst";
                            $dropdownconst = unserialize(PARTOFPAYMENT);
                        }
                        // Remove Status Id For Guest User
//                        if (empty($this->session->userdata('guest_user_id'))) {
                        if ($db_columns['Field'][$key] == 'status_id') {
                            $input_type = "dropdown";
                            $dropdown = $this->form_data['dropdown']['status'];
                        }
//                        }
                        // Guest User Code Ends

                        if ($db_columns['Field'][$key] == 'dp_specialities') {
                            $input_type = "multipleselectdropdown";
                            $dropdown = $this->form_data['dropdown']['parent'];
                        }
                        if ($db_columns['Field'][$key] == 'adv_image') {
                            $input_type = "file";
                            $foldername = 'images2';
                        }
                        if ($db_columns['Field'][$key] == 'carous_image') {
                            $input_type = "file";
                        }
                        if ($db_columns['Field'][$key] == 'maternity_image') {
                            $input_type = "file";
                        }
                        if ($db_columns['Field'][$key] == 'model_image') {
                            $input_type = "file";
                        }if($db_columns['Field'][$key] == 'advertise_image'){
                                $input_type = "file";
                        }
                        if($db_columns['Field'][$key] == 'engagement_image'){
                                $input_type = "file";
                        }if($db_columns['Field'][$key] == 'gif_image'){
                                $input_type = "file";
                        }if($db_columns['Field'][$key] == 'team_image'){
                                $input_type = "file";
                        }if($db_columns['Field'][$key] == 'wedding_image'){
                                $input_type = "file";
                        }if($db_columns['Field'][$key] == 'destination_image'){
                                $input_type = "file";
                        }if($db_columns['Field'][$key] == 'bridal_image'){
                                $input_type = "file";
                        }if($db_columns['Field'][$key] == 'makeup_image'){
                                $input_type = "file";
                        }if($db_columns['Field'][$key] == 'preWedding_image'){
                                $input_type = "file";
                        }if($db_columns['Field'][$key] == 'postWedding_image'){
                                $input_type = "file";
                        }if($db_columns['Field'][$key] == 'futureWedding_image'){
                                $input_type = "file";
                        }


                    
                    
                        if ($input_type == "text") {
                            if ($validation) {
                                if (form_error($this->form_data['columns'][$key1])) {
                                    $elements1 .= "<div class='alert alert-danger'>      
                            <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>"
                                            . form_error($this->form_data['columns'][$key1]) . " 
                            </div>";
                                }
                            }
                            if (empty($formdata)) {
                                $setValue = set_value($this->form_data['columns'][$key1]);
                            } else {
                                $setValue = isset($formdata[$this->form_data['columns'][$key1]]) ? $formdata[$this->form_data['columns'][$key1]] : '';
                            }
                            if ($this->form_data['columns'][$key1] == "dp_mobileno") {
                                if (empty($formdata)) {
                                    $elements .= '<div class="col-md-4"><div class="form-group">
                                     ' . $elements1 . '
                                                        <label for="">' . $this->form_data['names'][$key1] . ':</label><span id="' . $this->form_data['columns'][$key1] . '"></span>
                                                          <input type="text" class="form-control mobileno" id="' . $this->form_data['columns'][$key1] . '"  name="' . $this->form_data['columns'][$key1] . '[]" value="" maxlength="11" required>                                                              
                                                         </div></div><div class="clearfix"></div>';
                                } else {
                                    $dp_mobileno = explode("#", $formdata['dp_mobileno']);
                                    if ($dp_mobileno) {

                                        foreach ($dp_mobileno as $mobileno) {
                                            $elements .= '<div class="col-md-4"><div class="form-group">
                                     ' . $elements1 . '
                                                        <label for="">' . $this->form_data['names'][$key1] . ':</label><span id="' . $this->form_data['columns'][$key1] . '1"></span>
                                                          <input type="text" class="form-control mobileno" id="' . $this->form_data['columns'][$key1] . '"  name="' . $this->form_data['columns'][$key1] . '[]" value="' . $mobileno . '" maxlength="11" required>
                                                         <a href="javascript:void(0);" class="remove_editfield" id=""><i class="fa fa-trash" style="float: right;position: relative;left: 26px;bottom:36px;"></i></a>     
                                                         </div></div><div class="clearfix"></div>';
                                        }
                                    }
                                }
                            } else {
                                if ($this->form_data['columns'][$key1] == "dp_landno") {
                                    if (empty($formdata)) {
                                        $elements .= '<div class="col-md-4"><div class="form-group">
                                 ' . $elements1 . '
						    <label for="">' . $this->form_data['names'][$key1] . ':</label><span id="' . $this->form_data['columns'][$key1] . '"></span>
						      <input type="text" class="form-control landlineno" id="' . $this->form_data['columns'][$key1] . '"  name="' . $this->form_data['columns'][$key1] . '[]" value="" maxlength="14">                                                          
                               </div></div><div class="clearfix"></div>';
                                    } else {
                                        $dp_landno = explode("#", $formdata['dp_landno']);
                                        if ($dp_landno) {
                                            foreach ($dp_landno as $landno) {
                                                $elements .= '<div class="col-md-4"><div class="form-group">
                                 ' . $elements1 . '
						    <label for="">' . $this->form_data['names'][$key1] . ':</label><span id="' . $this->form_data['columns'][$key1] . '1"></span>
						      <input type="text" class="form-control landlineno" id="' . $this->form_data['columns'][$key1] . '"  name="' . $this->form_data['columns'][$key1] . '[]" value="' . $landno . '" maxlength="14">
                                                      <a href="javascript:void(0);" class="remove_editfield" id=""><i class="fa fa-trash" style="float: right;position: relative;left: 26px;bottom:36px;"></i></a>    
                               </div></div><div class="clearfix"></div>';
                                            }
                                        }
                                    }
                                } else {
                                    //echo "-----Key Value---";print_r($this->form_data['columns'][$key1]);
                                    if ($this->form_data['columns'][$key1] == "role_id" || $this->form_data['columns'][$key1] == "user_name") {
                                        $elements .= '<div class="col-md-4"><div class="form-group">
                                 ' . $elements1 . '
						    <label for="">' . $this->form_data['names'][$key1] . ':</label><span id="' . $this->form_data['columns'][$key1] . '1"></span>
						      <input type="text" class="form-control other" id="' . $this->form_data['columns'][$key1] . '"  name="' . $this->form_data['columns'][$key1] . '" value="' . $setValue . '"' . $readonly . '>
                               </div></div>';
                                    } else {
                                        $elements .= '<div class="col-md-4"><div class="form-group">
                                 ' . $elements1 . '
						    <label for="">' . $this->form_data['names'][$key1] . ':</label><span id="' . $this->form_data['columns'][$key1] . '1"></span>
						      <input type="text" class="form-control other" id="' . $this->form_data['columns'][$key1] . '"  name="' . $this->form_data['columns'][$key1] . '" value="' . $setValue . '">
                               </div></div>';
                                    }
                                }
                            }
                            $inputFields[$this->form_data['columns'][$key1]] = $elements;
                        }//if

                        if ($input_type == "password") {
//                            if(empty($formdata['business_edit'])){
                            if ($validation) {
                                if (form_error($this->form_data['columns'][$key1])) {
                                    $elements1 .= "<div class='alert alert-danger'>      
                            <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>"
                                            . form_error($this->form_data['columns'][$key1]) . " 
                            </div>";
                                }
                            }
//                            if (empty($formdata)) {
                            //echo "<pre>";print_r($formdata);
                            //die();
                            if (empty($formdata)) {
                                $elements .= '<div class="col-md-4"><div class="form-group">
                                  ' . $elements1 . '
						    <label for="">' . $this->form_data['names'][$key1] . ':</label><span id="' . $this->form_data['columns'][$key1] . '1"></span>
						      <input type="password" class="form-control" id="' . $this->form_data['columns'][$key1] . '"  name="' . $this->form_data['columns'][$key1] . '" ">
                                                                                                    </div></div>
                                                <div class="col-md-4"><div class="form-group">
                                  ' . $elements1 . '	    
                                                      <label for="">Confirm Password <span class="text-red">*</span>:</label><span id="' . "re_dp_pwd" . '1"></span>
						      <input type="password" class="form-control" id="re_dp_pwd"  name="re_dp_pwd" ">
                                                </div></div>';
                            } else {
                                //$elements = '';
                                $elements .= '<div class="col-md-4"><div class="form-group">
                                  ' . $elements1 . '
						    <label for="">' . $this->form_data['names'][$key1] . ':</label><span id="' . $this->form_data['columns'][$key1] . '1"></span>
						      <input type="password" class="form-control" id="' . $this->form_data['columns'][$key1] . '"  name="' . $this->form_data['columns'][$key1] . '" ">
                                                                                                    </div></div>';
                            }
//                            } else {
//                                $elements.='';
//                            }

                            $inputFields[$this->form_data['columns'][$key1]] = $elements;
                            //}
                        }//if

                        if ($input_type == "textarea") {
                            if ($validation) {
                                if (form_error($this->form_data['columns'][$key1])) {
                                    $elements1 .= "<div class='alert alert-danger'>      
                            <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>"
                                            . form_error($this->form_data['columns'][$key1]) . " 
                            </div>";
                                }
                            }
                            if (empty($formdata)) {
                                $setValue = set_value($this->form_data['columns'][$key1]);
                            } else {
                                $setValue = $formdata[$this->form_data['columns'][$key1]];
                            }
                            $elements .= '<div class="col-md-4"><div class="form-group">
                                 ' . $elements1 . '
						    <label for="">' . $this->form_data['names'][$key1] . ':</label><span id="' . $this->form_data['columns'][$key1] . '1"></span>
						      <textarea class="form-control" id="' . $this->form_data['columns'][$key1] . '"  name="' . $this->form_data['columns'][$key1] . '">' . $setValue . '</textarea>
                                               </div></div>';
                            $inputFields[$this->form_data['columns'][$key1]] = $elements;
                        }//if

                        if ($input_type == "textdate") {
                            if ($validation) {
                                if (form_error($this->form_data['columns'][$key1])) {
                                    $elements1 .= "<div class='alert alert-danger'>      
                           <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>"
                                            . form_error($this->form_data['columns'][$key1]) . " 
                           </div>";
                                }
                            }
                            $setValue = set_value($this->form_data['columns'][$key1]);
                            $elements .= '<div class="col-md-4"><div class="form-group"><div class="input-group date">
                                    ' . $elements1 . '
                            <label for="">' . $this->form_data['names'][$key1] . ':</label>
                              <input type="text" class="form-control" id="datepicker"  name="' . $this->form_data['columns'][$key1] . '" value="' . $setValue . '">
                              </div></div></div>';
                        }//if

                        if ($input_type == "file") {
                            if ($validation) {
                                if (form_error($this->form_data['columns'][$key1])) {
                                    $elements1 .= "<div class='alert alert-danger'>      
                            <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>"
                                            . form_error($this->form_data['columns'][$key1]) . " 
                            </div>";
                                }
                            }

                            if (empty($formdata)) {
                                $setValue = set_value($this->form_data['columns'][$key1]);
                                $elements .= '<div class="col-md-4"><div class="form-group">
                                 ' . $elements1 . '<label for="">' . $this->form_data['names'][$key1] . ':</label><span id="' . $this->form_data['columns'][$key1] . '1"></span>
                                                        <input type="file" class="form-control" id="' . $this->form_data['columns'][$key1] . '"  name="' . $this->form_data['columns'][$key1] . '" value="' . $setValue . '" required>
                                               </div></div>';
                            } else {
                                $formimage = $formdata[$this->form_data['columns'][$key1]];
                                if ($formimage == "") {
                                    $imageicon = '<img src="../../images/noimage.png" width="50" height="50">';
                                } else {
                                    $this->CI = & get_instance();
                                    $pathid = $this->CI->uri->segment(3);
                                    $url = $formimage;
                                    $imageicon = '<img src="' . base_url() . $url . '" width="50" height="50">';
                                }
                                $elements .= '<div class="col-md-4"><div class="form-group">
                                 ' . $elements1 . '<label for="">' . $this->form_data['names'][$key1] . ':</label><span id="' . $this->form_data['columns'][$key1] . '1"></span><br>'
                                        . $imageicon
                                        . '<input type="hidden" name="old_' . $this->form_data['columns'][$key1] . '" value="' . $formimage . '">'
                                        . '<input type="file" class="form-control" id="' . $this->form_data['columns'][$key1] . '"  name="' . $this->form_data['columns'][$key1] . '">'
                                        . '</div></div>';
                            }
                            $inputFields[$this->form_data['columns'][$key1]] = $elements;
                        }//if
                        if ($input_type == "radio") {
                            if ($validation) {
                                if (form_error($this->form_data['columns'][$key1])) {
                                    $elements1 .= "<div class='alert alert-danger'>      
                            <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>"
                                            . form_error($this->form_data['columns'][$key1]) . " 
                            </div>";
                                }
                            }
                            $name = $this->form_data['columns'][$key1];
                            $elements .= '<div class="col-md-4"><div class="form-group">
                                ' . $elements1 . '
						    <label for="">' . $this->form_data['names'][$key1] . ':</label><br />';
                            foreach ($radioarr as $key2 => $value1) {
                                $radid = $name . '_' . $value1;
                                if (empty($formdata)) {
                                    $setradio = set_radio($this->form_data['columns'][$key1], $value1);
                                } else {
                                    $setradio = '';
                                    print_r($selectval);
                                    $selectval = $formdata[$this->form_data['columns'][$key1]];
                                    $allraddata = explode("#", $selectval);
                                    foreach ($formdata as $key => $value) {
                                        if ($formdata[$key] == $value1)
                                            $setradio = 'checked="checked"';
                                    }
                                }
                                $elements .= '<input type="radio" value=' . $value1 . ' id="' . $radid . '"  name="' . $this->form_data['columns'][$key1] . '" ' . $setradio . '>'
                                        . '&nbsp<label for="' . $radid . '">' . $key2 . '</label>&nbsp&nbsp&nbsp&nbsp';
                            }
                            $elements .= '</div></div>';
                            $inputFields[$this->form_data['columns'][$key1]] = $elements;
                        }//if

                        if ($input_type == "dropdown") {
                            if ($validation) {
                                if (form_error($this->form_data['columns'][$key1])) {
                                    $elements1 .= "<div class='alert alert-danger'>      
                            <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>"
                                            . form_error($this->form_data['columns'][$key1]) . " 
                            </div>";
                                }
                            }
                            $elements .= '<div class="col-md-4"><div class="form-group">
                                ' . $elements1 . '
				           <label for="">' . $this->form_data['names'][$key1] . ':</label><span id="' . $this->form_data['columns'][$key1] . '1"></span>
					   <select class="form-control" id="' . $this->form_data['columns'][$key1] . '"  name="' . $this->form_data['columns'][$key1] . '">
                                           <option value="">--Select--</option>';
                            if (!empty($dropdown)) {
                                foreach ($dropdown as $key2 => $value1) {
                                    $arrkey = array_keys($value1);
                                    $paramaid = $arrkey[0];
                                    $paramaname = $arrkey[1];
                                    if (empty($formdata)) {
                                        $setselect = set_select($this->form_data['columns'][$key1], $dropdown[$key2][$paramaid]);
                                    } else {
                                        $selectval = $formdata[$this->form_data['columns'][$key1]];
                                        if ($dropdown[$key2][$paramaid] == $selectval)
                                            $setselect = ' selected="selected"';
                                        else
                                            $setselect = '';
                                    }
                                    $elements .= '<option value="' . $dropdown[$key2][$paramaid] . '"' . $setselect . '>' . $dropdown[$key2][$paramaname] . '</option>';
                                }
                            }
                            $elements .= '</select>';


                            $elements .= '</div></div>';

                            $inputFields[$this->form_data['columns'][$key1]] = $elements;
                        }//if

                        if ($input_type == "multipleselectdropdown") {
                            if ($validation) {
                                if (form_error($this->form_data['columns'][$key1])) {
                                    $elements1 .= "<div class='alert alert-danger'>      
                            <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>"
                                            . form_error($this->form_data['columns'][$key1]) . " 
                            </div>";
                                }
                            }
                            $setValue = set_value($this->form_data['columns'][$key1]);
                            $elements .= '<div class="col-md-4"><div class="form-group">
                                ' . $elements1 . '
				           <label for="">' . $this->form_data['names'][$key1] . ':</label>
					   <select class="form-control select2" id="' . $this->form_data['columns'][$key1] . '"  name="' . $this->form_data['columns'][$key1] . '" multiple="multiple" onchange=Onchange_multiplesel(this,"#hidden_' . $this->form_data['columns'][$key1] . '")>
                                           <option value="">--Select--</option>';
                            foreach ($dropdown as $key2 => $value1) {
                                $arrkey = array_keys($value1);
                                $paramaid = $arrkey[0];
                                $paramaname = $arrkey[1];
                                $setselect = set_select($this->form_data['columns'][$key1], $dropdown[$key2][$paramaid]);
                                $elements .= '<option value="' . $dropdown[$key2][$paramaid] . '"' . $setselect . '>' . $dropdown[$key2][$paramaname] . '</option>';
                            }
                            $elements .= '</select><input type="hidden" name="hidden_' . $this->form_data['columns'][$key1] . '" id="hidden_' . $this->form_data['columns'][$key1] . '">
                            </div></div>';
                            $inputFields[$this->form_data['columns'][$key1]] = $elements;
                        }//if
                        if ($input_type == "dropdownconst") {
                            if ($validation) {
                                if (form_error($this->form_data['columns'][$key1])) {
                                    $elements1 .= "<div class='alert alert-danger'>      
                            <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>"
                                            . form_error($this->form_data['columns'][$key1]) . " 
                            </div>";
                                }
                            }

                            $elements .= '<div class="col-md-4"><div class="form-group">
                                 ' . $elements1 . '
				           <label for="">' . $this->form_data['names'][$key1] . ':</label>
					   <select class="form-control" id="' . $this->form_data['columns'][$key1] . '"  name="' . $this->form_data['columns'][$key1] . '">
                                           <option value="">--Select--</option>';
                            foreach ($dropdownconst as $key2 => $value1) {
                                $setselect = set_select($this->form_data['columns'][$key1], $value1);
                                if (empty($formdata)) {
                                    $setselect = set_select($this->form_data['columns'][$key1], $value1);
                                } else {
                                    $selectval = $formdata[$this->form_data['columns'][$key1]];
                                    if ($value1 == $selectval)
                                        $setselect = ' selected="selected"';
                                    else
                                        $setselect = '';
                                }

                                $elements .= '<option value="' . $value1 . '" ' . $setselect . '>' . $key2 . '</option>';
                            }
                            $elements .= '</select>
                            </div></div>';
                            $inputFields[$this->form_data['columns'][$key1]] = $elements;
                        }//if

                        if ($input_type == "checkbox") {
                            if ($validation) {
                                if (form_error($this->form_data['columns'][$key1] . '[]')) {
                                    $elements .= "<div class='col-md-4'><div class='alert alert-danger'>      
                            <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>"
                                            . form_error($this->form_data['columns'][$key1] . '[]') . "
                            </div></div>";
                                }
                            }
                            $name = $this->form_data['columns'][$key1];
                            $elements .= '<div class="col-md-12"><div class="checkboxhere"><div class="form-group">';
                            foreach ($checkboxarr as $key2 => $value1) {
                                $arrkey = array_keys($value1);
                                $paramaid = $arrkey[0];
                                $paramaname = $arrkey[1];
                                $fieldvalue = $checkboxarr[$key2][$paramaid];
                                $checkid = $name . '_' . $fieldvalue;
                                if (empty($formdata)) {
                                    $setcheckbox = set_checkbox($this->form_data['columns'][$key1], $checkboxarr[$key2][$paramaid]);
                                } else {
                                    $setcheckbox = '';
                                    $selectval = $formdata[$this->form_data['columns'][$key1]];
                                    $allcheckdata = explode("#", $selectval);
                                    foreach ($allcheckdata as $key => $value) {
                                        if ($allcheckdata[$key] == $checkboxarr[$key2][$paramaid])
                                            $setcheckbox = ' checked="checked"';
                                    }
                                }
                                $elements .= '<div class="col-md-3"><input type="checkbox" name="' . $this->form_data['columns'][$key1] . '[]" id="' . $checkid . '" value="' . $fieldvalue . '" ' . $setcheckbox . '>'
                                        . '&nbsp<label for="' . $checkid . '">' . $checkboxarr[$key2][$paramaname] . '</label></div>';
                            }
                            $elements .= '<div class="clearfix"></div></div></div></div><br><br><br><br>';
                            $inputFields[$this->form_data['columns'][$key1]] = $elements;
                        }//if
                        if ($input_type == "editor") {
                            if ($validation) {
                                if (form_error($this->form_data['columns'][$key1])) {
                                    $elements1 .= "<div class='alert alert-danger'>      
                            <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>"
                                            . form_error($this->form_data['columns'][$key1]) . " 
                            </div>";
                                }
                            }
                            if (empty($formdata)) {
                                $setValue = set_value($this->form_data['columns'][$key1]);
                            } else {
                                $setValue = $formdata[$this->form_data['columns'][$key1]];
                            }
                            $elements .= '<div class="col-md-8"><div class="form-group">
                                 ' . $elements1 . '
						    <label for="">' . $this->form_data['names'][$key1] . ':</label><span id="' . $this->form_data['columns'][$key1] . '1"></span>
						      <textarea class="form-control" id="' . $this->form_data['columns'][$key1] . '"  name="' . $this->form_data['columns'][$key1] . '">' . $setValue . '</textarea>
                                               </div></div><div class="clearfix"></div>';
                            $inputFields[$this->form_data['columns'][$key1]] = $elements;
                        }
//                   ------  property multiple images & caption   -------------
                        if ($input_type == "profile_mult_image") {
                            //echo "<pre>";print_r($formdata[0]['guest_image']);
                            //die();
                            if (empty($formdata[0]['guest_image'])) {
                                $inputs = $this->generateImageDialogBox($columns, 9, $formdata, $contrname = 'profile_deleteProfileImages', $foldernm = 'profileimages');
                            } else {
                                $inputs = $this->generateImageDialogBox($columns, 9, $formdata, $contrname = 'dashboard_deleteDashboardProfileImages', $foldernm = 'profileimages');
                            }
//                            $inputs = $this->generateImageDialogBox($columns, 6);
                            return $inputs;
                        }
                        //die();
                        $elements = "";
                        $input_type = '';
                    }//if
                }//for
            }//for
        }//if
        $columns = $this->getUserColumns();

        foreach ($columns as $key) {
            if ($key == 'dp_businm') {
                $elements .= "<div class='clearfix'></div><div class='box-header with-border'>
              <h3 class='box-title text-blue'><i class='fa fa-list-alt'></i>&nbsp;&nbsp;General Details</h3>
            </div>";
            }
            if ($key == 'dp_mobileno') {
                $elements .= "<div class='clearfix'></div><div class='box-header with-border'>              
            </div>";
            }
            if ($key == 'dp_desc') {
                $elements .= "<div class='clearfix'></div><div class='box-header with-border'>
              <h3 class='box-title text-blue'><i class='fa fa-list-alt'></i>&nbsp;Extra Details</h3>
            </div>";
            }

//            if ($key == 'city_id') {
//                $elements.="<div class='clearfix'></div><div class='box-header with-border'>
//              <h3 class='box-title text-blue'><i class='fa fa-list-alt'></i>&nbsp;City & Area Details</h3>
//            </div>";
//            }
//            if ($key == 'area_id') {
//                $elements.="<div class='clearfix'></div><div class='box-header with-border'>
//              <h3 class='box-title text-blue'><i class='fa fa-list-alt'></i>&nbsp;City & Area Details</h3>
//            </div>";
//            }

            if ($key == 'country_id') {
                $elements .= "<div class='clearfix'></div><div class='box-header with-border'>
              <i class='fa fa-list-alt'></i>&nbsp;&nbsp;<h3 class='box-title text-blue'>Address Details</h3>
            </div>";
            }


            if ($key == 'spec_id') {
                $elements .= "<div class='clearfix'></div><div class='box-header with-border'>
              <i class='fa fa-list-alt'></i>&nbsp;<h3 class='box-title text-blue'>Specifications</h3>
            </div>";
            }
            if ($key == 'propimage' || $key == "projimage") {
                $elements .= "<div class='clearfix'></div><div class='box-header with-border'>
              <i class='fa fa-picture-o'></i>&nbsp;<h3 class='box-title text-blue'>Property Images</h3>
            </div>";
            }
            //Break Line
            if ($key == 'country_id' || $key == 'dp_lattitude' || $key == 'dp_desc' || $key == "dp_landno" || $key == "dp_email" || $key == "dp_profimg" || $key == "dp_pwd") {
                $elements .= "<div class='clearfix'></div>";
            }
            if ($key == 'dp_mobileno') {
                $elements .= "<div class='box-header with-border'>
              <h3 class='box-title text-blue'><i class='fa fa-list-alt'></i>&nbsp;&nbsp;Mobile Numbers&nbsp; <a href='javascript:void(0);' id='addmobfun'><img src='" . base_url() . "images/add.jpg' title='Add Product Details'></a></h3>             
            </div><div class='mobfunblock'></div>";
            }
            if ($key == 'dp_landno') {
                $elements .= "<div class='box-header with-border'>
              <h3 class='box-title text-blue'><i class='fa fa-list-alt'></i>&nbsp;&nbsp;Landline Numbers&nbsp; <a href='javascript:void(0);' id='adlandfun'><img src='" . base_url() . "images/add.jpg' title='Add Product Details'></a></h3>             
            </div><div class='landfunblock'></div>";
            }

            $elements .= $inputFields[$key];
        }
        $elements .= "<div class='clearfix'></div>";

        return $elements;
    }

    function getNames($columns) {
        
    }

    function generateImageDialogBox($columns, $noOfImages, $formdata = NULL, $contrname = NULL, $foldernm = NULL) {
        $this->CI = & get_instance();
        $fieldid = $this->CI->uri->segment(3);
        $fieldname1 = $columns[0];
        $fieldname2 = $columns[1];
        $fieldname3 = $columns[2];
        $elements = '';
        $elements .= '<div class="col-md-12"><div class=""><div class="form-group">';
        //echo "<pre>";print_r($formdata);
        if (empty($formdata)) {
            for ($i = 1; $i <= $noOfImages; $i++) {
                $elements .= '<div class="col-md-3">';
                $elements .= '<input type="text" class="form-control" name="' . $columns[1] . '[]" placeholder="Caption">';
                $elements .= '<input type="file" class="form-control file-4" name="' . $columns[2] . '[]" data-upload-url="#"><br /><br />'
                        . '</div>';
            }
        } else {
            $numrows = count($formdata);
            $remainingfiles = $noOfImages - $numrows;
            foreach ($formdata as $key => $value) {
                $caption = $formdata[$key][$fieldname2];
                $projimg = $formdata[$key][$fieldname3];
                list($contnm, $methodnm) = explode('_', $contrname);
                $imagehere = base_url() . 'uploads/' . $contnm . '/' . $fieldid . '/' . $foldernm . '/' . $projimg;
                //Edit Due to wrong image location
                $imagehere = base_url() . $projimg;
                //echo "Method---";print_r($methodnm);
                //echo "Contr----";print_r($contrname);
                $projicon = '<img src="' . $imagehere . '" width="225" height="270">';
                $url = base_url() . $contnm . '/' . $methodnm . '/' . $formdata[$key][$fieldname1];
                //echo "<br/>"."----URL----"."<br/>";
                //print_r($url);               

                $elements .= '<div class="col-md-3">';
                $elements .= '<input type="text" readonly="" class="form-control" name="old_' . $columns[1] . '[]" value="' . $caption . '" placeholder="Caption">'
                        . $projicon;
                $elements .= "<div><a href='{$url}'><button type='button' class='btn btn-primary'><span class='glyphicon glyphicon-remove delete-icon'></span></button><a/></div>";
                $elements .= '</div>';
            }
            for ($i = 1; $i <= $remainingfiles; $i++) {
                $elements .= '<div class="col-md-3">';
                $elements .= '<input type="text" class="form-control" name="' . $columns[1] . '[]" placeholder="Caption">';
                $elements .= '<input type="file" class="form-control file-4" name="' . $columns[2] . '[]" data-upload-url="#"><br /><br />'
                        . '</div>';
            }
        }
        $elements .= '<div class="clearfix"></div></div></div></div>';
        return $elements;
    }

    function editForm($db_columns, $validation = FALSE, $formData) {
        $columns = $this->getUserColumns();
    }

}

/* End of file Template.php */
    /* Location: ./system/application/libraries/Template.php */    
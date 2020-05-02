<?php

class MaternityEntity {

    const maternity_image = 'maternity_image';
    const image_caption = 'image_caption';
    const status_id = 'status_id';

    function getFormColumns() {
//        echo 'hihi';die;
        return array(self::maternity_image, self::image_caption, self::status_id);
    }

    function getFormLabels() {
        return array('Maternity Image<span style="color:red;">*</span>', 'Maternity Caption<span style="color:red;">*</span>', 'Status<span style="color:red;">*</span>');
    }

}

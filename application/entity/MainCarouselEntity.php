<?php

class MainCarouselEntity {

    const carous_image = 'carous_image';
    const image_caption = 'image_caption';
    const status_id = 'status_id';

    function getFormColumns() {
//        echo 'hihi';die;
        return array(self::carous_image, self::image_caption, self::status_id);
    }

    function getFormLabels() {
        return array('Carous Image<span style="color:red;">*</span>', 'Image Caption<span style="color:red;">*</span>', 'Status<span style="color:red;">*</span>');
    }

}

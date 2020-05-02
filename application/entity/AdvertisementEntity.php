<?php

class AdvertisementEntity {

    const advertise_image = 'advertise_image';
    const image_caption = 'image_caption';
    const status_id = 'status_id';

    function getFormColumns() {
//        echo 'hihi';die;
        return array(self::advertise_image, self::image_caption, self::status_id);
    }

    function getFormLabels() {
        return array('Advertisement Image<span style="color:red;">*</span>', 'Image Caption<span style="color:red;">*</span>', 'Status<span style="color:red;">*</span>');
    }

}

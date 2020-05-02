<?php

class DestWeddingEntity {

    const destination_image = 'destination_image';
    const image_caption = 'image_caption';
    const status_id = 'status_id';

    function getFormColumns() {
        return array(self::destination_image, self::image_caption, self::status_id);
    }

    function getFormLabels() {
        return array('Destination Wedding Image<span style="color:red;">*</span>', 'Wedding Image Caption<span style="color:red;">*</span>', 'Status<span style="color:red;">*</span>');
    }

}

<?php

class WeddingEntity {

    const wedding_image = 'wedding_image';
    const image_caption = 'image_caption';
    const status_id = 'status_id';

    function getFormColumns() {
        return array(self::wedding_image, self::image_caption, self::status_id);
    }

    function getFormLabels() {
        return array('Wedding Image<span style="color:red;">*</span>', 'Wedding Image Caption<span style="color:red;">*</span>', 'Status<span style="color:red;">*</span>');
    }

}

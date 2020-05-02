<?php

class BridalEntity {

    const bridal_image = 'bridal_image';
    const bridal_caption = 'bridal_caption';
    const status_id = 'status_id';

    function getFormColumns() {
        return array(self::bridal_image, self::bridal_caption, self::status_id);
    }

    function getFormLabels() {
        return array('Bridal Image<span style="color:red;">*</span>', 'Bridal Caption<span style="color:red;">*</span>', 'Status<span style="color:red;">*</span>');
    }

}

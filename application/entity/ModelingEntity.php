<?php

class ModelingEntity {

    const model_image = 'model_image';
    const image_caption = 'image_caption';
    const status_id = 'status_id';

    function getFormColumns() {
        return array(self::model_image, self::image_caption, self::status_id);
    }

    function getFormLabels() {
        return array('Modeling  Image<span style="color:red;">*</span>', 'Model Image Caption<span style="color:red;">*</span>', 'Status<span style="color:red;">*</span>');
    }

}

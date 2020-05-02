<?php

class MakeupEntity {

    const makeup_image = 'makeup_image';
    const makeup_caption = 'makeup_caption';
    const status_id = 'status_id';

    function getFormColumns() {
        return array(self::makeup_image, self::makeup_caption, self::status_id);
    }

    function getFormLabels() {
        return array('Makeup Image<span style="color:red;">*</span>', 'Makeup Caption<span style="color:red;">*</span>', 'Status<span style="color:red;">*</span>');
    }

}

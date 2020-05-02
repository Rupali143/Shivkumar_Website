<?php

class GifEntity {

    const gif_image = 'gif_image';
    const image_caption = 'image_caption';
    const status_id = 'status_id';

    function getFormColumns() {
        return array(self::gif_image, self::image_caption, self::status_id);
    }

    function getFormLabels() {
        return array('Gif<span style="color:red;">*</span>', 'Gif Caption<span style="color:red;">*</span>', 'Status<span style="color:red;">*</span>');
    }

}

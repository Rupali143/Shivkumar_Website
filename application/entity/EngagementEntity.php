<?php

class EngagementEntity {

    const engagement_image = 'engagement_image';
    const image_caption = 'image_caption';
    const status_id = 'status_id';

    function getFormColumns() {
        return array(self::engagement_image, self::image_caption, self::status_id);
    }

    function getFormLabels() {
        return array('Engagement Image<span style="color:red;">*</span>', 'Image Caption<span style="color:red;">*</span>', 'Status<span style="color:red;">*</span>');
    }

}

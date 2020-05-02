<?php

class PostWeddingEntity {

    const postWedding_image = 'postWedding_image';
    const postWedding_caption = 'postWedding_caption';
    const status_id = 'status_id';

    function getFormColumns() {
        return array(self::postWedding_image, self::postWedding_caption, self::status_id);
    }

    function getFormLabels() {
        return array('Post-Wedding Image<span style="color:red;">*</span>', 'Post-Wedding Image Caption<span style="color:red;">*</span>', 'Status<span style="color:red;">*</span>');
    }

}

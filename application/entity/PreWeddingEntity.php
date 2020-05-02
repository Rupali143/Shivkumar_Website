<?php

class PreWeddingEntity {

    const preWedding_image = 'preWedding_image';
    const preWedding_caption = 'preWedding_caption';
    const status_id = 'status_id';

    function getFormColumns() {
        return array(self::preWedding_image, self::preWedding_caption, self::status_id);
    }

    function getFormLabels() {
        return array('Pre-Wedding Image<span style="color:red;">*</span>', 'Pre-Wedding Image Caption<span style="color:red;">*</span>', 'Status<span style="color:red;">*</span>');
    }

}

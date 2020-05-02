<?php

class FutureWeddingEntity {

    const futureWedding_image = 'futureWedding_image';
    const futureWedding_caption = 'futureWedding_caption';
    const status_id = 'status_id';

    function getFormColumns() {
        return array(self::futureWedding_image, self::futureWedding_caption, self::status_id);
    }

    function getFormLabels() {
        return array('Future-Wedding Image<span style="color:red;">*</span>', 'Future-Wedding Image Caption<span style="color:red;">*</span>', 'Status<span style="color:red;">*</span>');
    }

}

<?php

class TeamEntity {

    const team_image = 'team_image';
    const member_name = 'member_name';
    const status_id = 'status_id';

    function getFormColumns() {
        return array(self::team_image, self::member_name, self::status_id);
    }

    function getFormLabels() {
        return array('Team<span style="color:red;">*</span>', 'Team Member name<span style="color:red;">*</span>', 'Status<span style="color:red;">*</span>');
    }

}

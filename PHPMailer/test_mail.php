<?php

require_once 'myphpmailer.php';
$sendObjPhpmailer = new myphpmailer();
$to_email='amol.patil@nadsoftdev.com';
$femail='amol.patil@nadsoftdev.com';
$subject='test mail';
$content='test mail';

echo $resofphp=$sendObjPhpmailer->sendEmail_phpmailer($to_email, $femail, $subject, $content);
die();
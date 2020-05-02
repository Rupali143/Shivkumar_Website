<?php
class myphpmailer {
        function generateContentID($length = 16) {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return 'ii_'.$randomString;
    }

    function base64encodeFile($file) {
        $encoded = '';
        if($file) {
            $encoded = base64_encode(fread(fopen($file, "r"), filesize($file)));
        }
        return $encoded;
    }
   function sendEmail_phpmailer($to, $from, $subject, $content, $attach = array()) {
    
      $arrto=explode(",", $to);	
      $arrto= array_filter($arrto); 
      require_once "PHPMailerAutoload.php";
   		//Create a new PHPMailer instance
		$phpmail = new PHPMailer;

		//Tell PHPMailer to use SMTP
		$phpmail->isSMTP();

		//Enable SMTP debugging
		// 0 = off (for production use)
		// 1 = client messages
		// 2 = client and server messages
		$phpmail->SMTPDebug = 1;
	   //Ask for HTML-friendly debug output
		$phpmail->Debugoutput = 'html';
		//Set the hostname of the phpmail server
		$phpmail->Host = 'smtp.gmail.com';
	
	   //Set the SMTP port number - 587 for authenticated TLS, a.k.a. RFC4409 SMTP submission
		$phpmail->Port = 465;
		//Set the encryption system to use - ssl (deprecated) or tls
		$phpmail->SMTPSecure = 'ssl';
        //Whether to use SMTP authentication
		$phpmail->SMTPAuth = true;
		//$phpmail->isHTML(true);

	    $phpmail->Username = "shreyaphotospalus@gmail.com";
        $phpmail->Password = "9823249523";
        /*$phpmail->Username = "tushar@nadsoftdev.com";
        $phpmail->Password = "nadsoftss123456";*/
		$phpmail->From =$from;
		$phpmail->FromName = "WeddingShreya";
		$phpmail->setFrom($from, 'WeddingShreya');
 		foreach ($arrto as  $valueofmail) {
         $phpmail->addAddress($valueofmail);
        }
        $phpmail->Subject = $subject;
		

		//Read an HTML message body from an external file, convert referenced images to embedded,
		//convert HTML into a basic plain-text alternative body
		$phpmail->msgHTML($content);

		if (!$phpmail->send()) {

               $res = 400 ;    
                return $res;
		    
		} else {
		        
                 $res = 200 ;    
                 return $res;

              }

        

		}
	

	

 }

?>
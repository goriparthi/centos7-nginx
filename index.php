<?php  

// Sample Hostname Display page

function random_color_part() {
    return str_pad( dechex( mt_rand( 0, 255 ) ), 2, '0', STR_PAD_LEFT);
}

function random_color() {
    return random_color_part() . random_color_part() . random_color_part();
}


//Display servername and time

echo "You have successfully deployed nginx container, congratulations !";

echo '<hr><div style="color:#'.random_color().'">
	  <h3>ServerName : '.gethostname().'</h3>
	  <h3>DateTime : '.date(DATE_RFC2822).'</h3>
      </div>';

?>

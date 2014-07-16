<?php
function display_persons_form() {
	//$the_path = str_replace("wp-admin", "wp-content/themes/twentyfourteen/", getcwd());


	echo "<form action=\""."../wp-content/themes/twentyfourteen/"."form-person-store.php\" method=\"post\">";

	echo "Name:<input type=\"text\" name=\"name\" value=\"\">";
	echo "<br>";
	echo "Location: <input type=\"text\" name=\"location\" value=\"\">";
	echo "<br>";
	echo "Major: <input type=\"text\" name=\"major\" value=\"\">";
	echo "<br>";
	echo "Year: <input type=\"text\" name=\"year\" value=\"\">";
	echo "<br>";
	echo "E-mail: <input type=\"text\" name=\"email\" value=\"\">";
	echo "<br>";
	echo "Designation: <select name=\"designation\">";
		echo "<option value=\"faculty\">Faculty</option>";
  		echo "<option value=\"student\">Student</option>";
  	echo "</select>";
	echo "<br>";
	echo "Bio: <textarea name=\"comment\" rows=\"5\" cols=\"40\"></textarea>";
	echo "<input type=\"submit\" value=\"Submit\">";
	echo "<br>";
	echo "</form>";

	
}
?>
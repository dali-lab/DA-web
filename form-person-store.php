<?php

echo $_POST['name'];
echo "<br>";
echo $_POST['location'];
echo "<br>";
echo $_POST['major'];
echo "<br>";
echo $_POST['year'];


global $wpdb;
$table_name = $wpdb->prefix . 'people';
if($wpdb->get_var("SHOW TABLES LIKE '".$table_name."'") != $table_name) {
    echo "table don't exist";
}

?>
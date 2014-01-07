<?php
/*
Template Name: Major About Page
*/

get_header('majorabout');

 ?>



<div id="lord_container">



	<?php

	$children = get_pages('child_of='.$post->post_parent.'&sort_column=menu_order&parent='.$post->post_parent);
	if ($children) { 
	?>


	<?php 

	
	$count = 0;

	foreach($children as $post){
		$count += 1;
		$parity = $count % 2;


		
		echo "<div class=\"post_title_".strval($parity)."\">";
			echo "<p>".strtoupper($post->post_title)."</p>";
		echo "</div>";

		echo "<div class=\"cont_".strval($parity)."\" id=\"actual_cont_".strval($count)."\">";
			echo "<p>";



			$content = apply_filters('the_content', $post->post_content);
			echo $content;
		
			echo "</p>";

		echo "</div>";
	}

	$GLOBALS['post_count'] = $count;

	

	?>



	<?php } ?>


</div>

<div id="floater">

	<?php

		$x = $GLOBALS['post_count'];
		for ($i = 0; $i < $x; $i++) {

			echo "<div class=\"circles\" id=\"circle_".strval($i+1)."\"> </div>";

		}	

	?>

<div>




<?php


//get_sidebar('content');
//get_footer();

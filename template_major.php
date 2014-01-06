<?php
/*
Template Name: Major
*/

get_header('majorminor');

 ?>


<div id="lotr">




	<div id="top_ring_container">
			<div id="page_title">
				<?php echo get_the_title($ID); ?> 
			</div>
	</div>



	<div id="bottom_ring_container"

		<?php

		  $children = get_pages('child_of='.$post->ID.'&sort_column=menu_order&parent='.$post->ID);
		  if ($children) { 
		?>
			<div id= "wtf">
				<?php 

				echo "<div id=\"ring_div\">";

				foreach($children as $value){
					echo "<p>";

					echo "<a href=\"".$value->guid."\">".strtoupper($value->post_title)."</a>";
				
					echo "</p>";
				}

				echo "</div";

				?>



			</div>
			
		<?php } ?>
	</div>

</div>



<?php


//get_sidebar();
//get_footer();

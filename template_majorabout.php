<?php
/*
Template Name: Major About Page
*/

get_header('majorabout');

 ?>



<div id="lord_container">
	<div id="page_title">
		<p> <?php echo strtoupper(get_the_title($ID)); ?> </p>
	</div>

	<div id="cont_1" class="container">


		<div id="content">
			<?php while (have_posts()) : the_post();/* Start loop */ ?>
		        <?php the_content(); ?>
			<?php endwhile; /* End loop */ ?>
		</div>
	</div>

	<div id="cont_2" class="container">
		<div id="content">

			<?php 
				function show_post($path) {
				  $post = get_page($post->ID);
				  $content = apply_filters('the_content', $post->post_content);
				  echo "<p>";
				  echo $content;
				  echo "</p>";
				}

				show_post('major/about');
			?>
		</div>
	</div>
</div>




<?php


//get_sidebar();
//get_footer();

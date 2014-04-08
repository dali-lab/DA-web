<?php
/*
Template Name: News Jobs
*/

get_header('news');

 ?>


<div class="modalmodal">

	<div id="modal_closer">
		X
	</div>



	<div id="modal_inner_wrapper">
		<p> Hi. I'm looking <br> for ... <br> </p>

		<form id="search_modal_form" role="search" action="<?php echo home_url( '/' ); ?>">

			<div id="textForm">
				<input type="text" name="s" value ="">
			</div>

			<div id="submitForm">
				<input type="submit" value="Search">
			</div>

		</form>


	</div>

</div>

<div class="modal">


</div>

<div id="lord_container">

	<?php 
		$count = 0;
		query_posts('category_name=cat_news,cat_jobs&showposts=5');
		while (have_posts()) : the_post();
		  // do whatever you want

				$count += 1;
				$parity = $count % 2;


			echo "<div style=\"background-color:green;\" id=\"news_wrapper_".strval($count)."\">";

				echo "<div class=\"post_title_".strval($parity)."\" id=\"actual_title_".strval($count)."\">";
					if ( in_category('cat_news') ) {
						echo "NEWS.";
					} else {
						echo "JOB OPPORTUNITIES.";
					}
					echo "<p>".strtoupper(get_the_title())."</p>";
				echo "</div>";


				echo "<div class=\"cont_".strval($parity)."\" id=\"actual_cont_".strval($count)."\">";
				echo "<p>";
				the_excerpt();
				echo get_the_time('n.j.y');
				echo "<a href=\"".get_permalink()."\">"." <span id=\"read\"> READ >> </span> </a>";
				echo "</p>";

	
				echo "</div>";
			echo "</div>";

		endwhile;

		wp_reset_query();
	?>

	
	
</div>






<?php


//get_sidebar('content');
//get_footer();

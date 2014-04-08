<?php
/*
Template Name: Fishy Landing Page
*/

get_header('landing');

 ?>


<div class="modal">

</div>

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



<canvas id="mysketch" data-processing-sources="http://localhost/wordpress/wp-content/themes/twentyfourteen/fishy/fishy.pde"></canvas>

<div id="main-content" class="main-content">

</div><!-- #main-content -->



<?php


//get_sidebar();
//get_footer();

<?php

?><!DOCTYPE html>
<!--[if IE 7]>
<html class="ie ie7" <?php language_attributes(); ?>>
<![endif]-->
<!--[if IE 8]>
<html class="ie ie8" <?php language_attributes(); ?>>
<![endif]-->
<!--[if !(IE 7) | !(IE 8) ]><!-->
<html <?php language_attributes(); ?>>
<!--<![endif]-->
<head>
	<meta charset="<?php bloginfo( 'charset' ); ?>">
	<meta name="viewport" content="width=device-width">
	<title><?php wp_title( '|', true, 'right' ); ?></title>
	<link rel="profile" href="http://gmpg.org/xfn/11">
	<link rel="pingback" href="<?php bloginfo( 'pingback_url' ); ?>">
	<!--[if lt IE 9]>
	<script src="<?php echo get_template_directory_uri(); ?>/js/html5.js"></script>
	<![endif]-->

	<?php wp_enqueue_script('jquery'); ?>

	<?php wp_head(); ?>

	<script>


		jQuery(document).ready(function($){
		  $("#search-box-modal-container").click(function(){

		    	$(".modal").css("display", "block");
		    	$(".modalmodal").css("display", "block");
		    	$("#floater").hide();

		    	var pos = parseInt($( window ).height()) / 2 ;

		    	console.log(pos);

		    	// $('.modalmodal').css('top', String(pos).concat("px"));

		  });


		  $("#modal_closer").click(function(){

		    	$(".modal").css("display", "none");
		    	$(".modalmodal").css("display", "none");
		    	$("#floater").show();

		    	var pos = parseInt($( window ).height()) / 2 ;

		    	console.log(pos);

		    	// $('.modalmodal').css('top', String(pos).concat("px"));

		  });

		});
				

		jQuery(function($){
			var n = parseInt($(window).height()/8);
			var h = String(n); 
			$('.cont_0').css('height', h.concat("px"));
			$('.cont_1').css('height', h.concat("px"));
		});


		var previous_c = null;
		

		


		jQuery(function($){

			for (var i=1;i<100;i++)
			{
				var wrapper = "#actual_title_" + i.toString();


				$(wrapper).hover(function(){
		            $(".post_title_1").css("background-color", "#ffffff");
		            $(".cont_1").css("background-color", "#ffffff");
		            $(".post_title_0").css("background-color", "#ebebeb");
		            $(".cont_0").css("background-color", "#ebebeb");
					wrapper = "#"+ $(this).attr("id");
					var number = parseInt(wrapper.charAt(wrapper.length-1));
		         	$(wrapper).css("background-color", "transparent");
         			$("#actual_cont_"+number.toString()).css("background-color", "transparent");
	     		});

				wrapper = "#actual_cont_" + i.toString();


				$(wrapper).hover(function(){
		            $(".post_title_1").css("background-color", "#ffffff");
		            $(".cont_1").css("background-color", "#ffffff");
		            $(".post_title_0").css("background-color", "#ebebeb");
		            $(".cont_0").css("background-color", "#ebebeb");
					wrapper = "#"+ $(this).attr("id");
					var number = parseInt(wrapper.charAt(wrapper.length-1));
		         	$(wrapper).css("background-color", "transparent");
         			$("#actual_title_"+number.toString()).css("background-color", "transparent");
	     		});


			}

		});


    </script>


	<link type="text/css" rel="stylesheet" href="http://localhost/wordpress/wp-content/themes/twentyfourteen/custom_css/style_header.css"/>
	<link type="text/css" rel="stylesheet" href="http://localhost/wordpress/wp-content/themes/twentyfourteen/custom_css/style_news.css"/>
	<link type="text/css" rel="stylesheet" href="http://localhost/wordpress/wp-content/themes/twentyfourteen/custom_css/style_searchmodal.css"/>
</head>



<body <?php body_class(); ?>>
<div id="page" class="hfeed site">

	<?php if ( get_header_image() ) : ?>
	<div id="site-header">
		<a href="<?php echo esc_url( home_url( '/' ) ); ?>" rel="home">
			<img src="<?php header_image(); ?>" width="<?php echo get_custom_header()->width; ?>" height="<?php echo get_custom_header()->height; ?>" alt="">
		</a>
	</div>
	<?php endif; ?>

	<header id="masthead" class="site-header" role="banner">
		<div class="header-main">
			<h1 class="site-title"><a href="<?php echo esc_url( home_url( '/' ) ); ?>" rel="home"><?php bloginfo( 'name' ); ?></a></h1>

<!-- 			<div class="search-toggle">
				<a href="#search-container" class="screen-reader-text"><?php _e( 'Search', 'twentyfourteen' ); ?></a>
			</div> -->

			<div id="search-box-modal-container">
				<div id="search-box-modal">
				</div>
				
			</div>

			<nav id="primary-navigation" class="site-navigation primary-navigation" role="navigation">
				<h1 class="menu-toggle"><?php _e( 'Primary Menu', 'twentyfourteen' ); ?></h1>
				<a class="screen-reader-text skip-link" href="#content"><?php _e( 'Skip to content', 'twentyfourteen' ); ?></a>
				<?php wp_nav_menu( array( 'theme_location' => 'primary','menu' => 'standard', 'menu_class' => 'nav-menu' ) ); ?>
			</nav>
		</div>

<!-- 		<div id="search-container" class="search-box-wrapper hide">
			<div class="search-box">
				<?php get_search_form(); ?>
			</div>
		</div> -->


		
	</header><!-- #masthead -->

	<div id="main" class="site-main">
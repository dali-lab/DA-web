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
	<?php wp_head(); ?>


	<link type="text/css" rel="stylesheet" href="http://localhost/wordpress/wp-content/themes/twentyfourteen/custom_css/style_landing.css"/>
	<link type="text/css" rel="stylesheet" href="http://localhost/wordpress/wp-content/themes/twentyfourteen/custom_css/style_header.css"/>
	<script type="text/javascript" src="http://localhost/wordpress/wp-content/themes/twentyfourteen/fishy/processing.js"></script>
	

	<script type="text/javascript">


	var w = jQuery(window).width();



	function p_get_width(){
		return parseInt(w);

	}


	var bound = false;
	function bindJavascript() {
		var pjs = Processing.getInstanceById('mysketch');
		if(pjs!=null) {
			pjs.bindJavascript(this);
			bound = true; 
			pjs.resize();
		}
		if(!bound) setTimeout(bindJavascript, 250); 
	}

	bindJavascript();



	
	</script>



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

			<div class="search-toggle">
				<a href="#search-container" class="screen-reader-text"><?php _e( 'Search', 'twentyfourteen' ); ?></a>
			</div>

			<nav id="primary-navigation" class="site-navigation primary-navigation" role="navigation">
				<h1 class="menu-toggle"><?php _e( 'Primary Menu', 'twentyfourteen' ); ?></h1>
				<a class="screen-reader-text skip-link" href="#content"><?php _e( 'Skip to content', 'twentyfourteen' ); ?></a>
				<?php wp_nav_menu( array( 'theme_location' => 'primary', 'menu_class' => 'nav-menu' ) ); ?>
			</nav>
		</div>

		<div id="search-container" class="search-box-wrapper hide">
			<div class="search-box">
				<?php get_search_form(); ?>
			</div>
		</div>
	</header><!-- #masthead -->

	<div id="main" class="site-main">
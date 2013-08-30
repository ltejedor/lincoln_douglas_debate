// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require twitter/bootstrap


$(document).ready(function() {

	// Set up proper tab activation for buttons within multi-tab Tournament form
		
	$('a[data-toggle="tab"]').filter('.btn').on('click.showtab', function (e) {		
		$('li').removeClass('active');
		var tabref = $(this).attr('href');
		$('a[href="'+tabref+'"]').filter('.tabBar').parent().addClass('active');
		console.log('clicked');
	})
	
	// square off image on tournament during page refresh
	// TODO: allow dynamic resizing
	var cw = $('.tournament-image').width();
	var w = cw + 'px';
	$('.crop').css('height',w);  
	

});


// TODO: Prevent Navbar overlap on div below.
// (Navbar currently overlaps content while changing in size)
// Use jQuery solution: http://stackoverflow.com/questions/11920846/prevent-a-div-to-overlap-over-a-fixed-one
 


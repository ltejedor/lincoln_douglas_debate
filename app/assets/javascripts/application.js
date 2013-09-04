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
//= require gplus
//= require tree .
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

// Nested Forms

function remove_fields(link) {
  $(link).previous("input[type=hidden]").value = "1";
  $(link).up(".fields").hide();
}

// Tooltips over badges (achievements)
$('.achievement').tooltip()

// TODO: Prevent Navbar overlap on div below.
// (Navbar currently overlaps content while changing in size)
// Use jQuery solution: http://stackoverflow.com/questions/11920846/prevent-a-div-to-overlap-over-a-fixed-one

// ******* FORMS *********


$('form').on('click', '.remove_fields', function(event) {
  $(this).prev('input[type=hidden]').val('1');
  $(this).closest('fieldset').hide();
  return event.preventDefault();
});

$('form').on('click', '.remove_fields_division', function(event) {
  $(this).next().next().next().removeClass('hide-this');
  return event.preventDefault();
});

$('form').on('click', '.remove_fields_brackets', function(event) {
  $(this).prev('input[type=hidden]').val('1');
  $(this).parent().parent().hide();
  return event.preventDefault();
});

$('form').on('click', '.remove_fields_in_table', function(event) {
  $(this).prev('input[type=hidden]').val('1');
  $(this).parent().parent().closest('fieldset').hide();
  return event.preventDefault();
});

$('form').on('click', '.add_fields', function(event) {
  var regexp, time;
  time = new Date().getTime();
  regexp = new RegExp($(this).data('id'), 'g');
  $(this).before($(this).data('fields').replace(regexp, time).replace(/dynamic_time/g, time));
  return event.preventDefault();
});

$('form').on('click', '.add_fields_in_table', function(event) {
  var num, regexp, time, uniqueID;
  time = new Date().getTime();
  num = $(this).last().parent().parent().index();
  uniqueID = time + '-' + num;
  regexp = new RegExp($(this).data('id'), 'g');
  $(this).parent().parent().before($(this).data('fields').replace(regexp, uniqueID).replace(/dynamic_time/g, uniqueID));
  return event.preventDefault();
});

$('form').on('click', '.round-row', function(event) {
  var time;
  time = new Date().getTime();
  $(this).attr('data-target', '#round-' + time);
  return $(this).next().attr('id', 'round-' + time);
});

$('form').on('change', '.round-kind', function(event) {
  return $(this).parent().parent().parent().parent().prev().children().first().next().removeClass('bracket-filler').html('<b>' + $(this).val() + '</b>');
});

$('form').on('click.current', '.add_fields_in_row', function(event) {
  var regexp, time;
  time = new Date().getTime();
  regexp = new RegExp($(this).data('id'), 'g');
  $(this).parent().before($(this).data('fields').replace(regexp, time).replace(/dynamic_time/g, time));
  return event.preventDefault();
});

$("form").on("keyup", "input.bracket-time", function() {
  var re;
  re = /\d{1,2}\/\d{1,2}\/\d{4} \d{1,2}:\d{2}(am|AM|pm|PM)/;
  if ($(this).val().match(re)) {
    return $(this).parent().parent().next().addClass("hide-this");
  } else {
    return $(this).parent().parent().next().removeClass("hide-this");
  }
});

$('form').on('click', '.new-division-link', function() {
  if ($(this).parent().parent().next().children().children('.row').children('.division-name').children('.tournament_divisions_name').children('div').children().val() === "") {
    return $(this).parent().parent().next().children().children('table').addClass('hide-table');
  }
});

$("form").on("keyup", "input[placeholder=\"Division Name\"]", function() {
  if ($(this).val() !== "") {
    $(this).first().parent().parent().parent().parent().next().next().removeClass("hide-table");
  }
  if ($(this).val() === "") {
    $(this).first().parent().parent().parent().parent().next().next().addClass("hide-table");
  }
  if ($(this).val() === "") {
    $(this).last().parent().parent().parent().parent().parent().parent().prev().children('h4').children('a').text('Unnamed Division (will be deleted)');
  }
  if ($(this).val() !== "") {
    return $(this).last().parent().parent().parent().parent().parent().parent().prev().children('h4').children('a').text($(this).val());
  }
});




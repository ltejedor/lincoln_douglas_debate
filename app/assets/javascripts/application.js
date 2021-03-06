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


// Nested Forms

    function remove_fields(link) {
        $(link).previous("input[type=hidden]").value = "1";
        $(link).up(".fields").hide();
    }

// Tooltips
    $('.achievement').tooltip()
    $('.connection').tooltip()

// TODO: Prevent Navbar overlap on div below.
// (Navbar currently overlaps content while changing in size)
// Use jQuery solution: http://stackoverflow.com/questions/11920846/prevent-a-div-to-overlap-over-a-fixed-one

// ******* FORMS *********


    // Remove fields
    $('form').on('click', '.remove_fields', function(event) {
        $(this).prev('input[type=hidden]').val('1');
        $(this).closest('fieldset').hide();
        return event.preventDefault();
    });


    // - Division
    $('form').on('click', '.remove_fields_division', function(event) {
        $(this).next().next().next().removeClass('hide-this');
        return event.preventDefault();
    });

    // - Bracket
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

    // + Division
    $('form').on('click', '.add_fields', function(event) {
        var regexp, time;
        time = new Date().getTime();
        regexp = new RegExp($(this).data('id'), 'g');
        $(this).before($(this).data('fields').replace(regexp, time).replace(/dynamic_time/g, time));
        return event.preventDefault();
    });

    // + Round
    $('form').on('click', '.add_fields_in_table', function(event) {
        var num, regexp, time, uniqueID;
        time = new Date().getTime();
        num = $(this).last().parent().parent().index();
        uniqueID = time + '-' + num;
        regexp = new RegExp($(this).data('id'), 'g');
        $(this).parent().parent().before($(this).data('fields').replace(regexp, uniqueID).replace(/dynamic_time/g, uniqueID));
        return event.preventDefault();
    });

    // Round collapse, unique ID fix for +Round in New Divisions. Change Unique ID per round collapse
    $('form').on('click', '.round-row', function(event) {
        var time;
        time = new Date().getTime();
        $(this).attr('data-target', '#round-' + time);
        return $(this).next().attr('id', 'round-' + time);
    });

    // Round editing live-update
    $('form').on('change', '.round-kind', function(event) {
        return $(this).parent().parent().parent().parent().prev().children().first().next().removeClass('bracket-filler').html('<b>' + $(this).val() + '</b>');
    });

    // + Bracket
    $('form').on('click.current', '.add_fields_in_row', function(event) {
        var regexp, time;
        time = new Date().getTime();
        regexp = new RegExp($(this).data('id'), 'g');
        $(this).parent().before($(this).data('fields').replace(regexp, time).replace(/dynamic_time/g, time));
        return event.preventDefault();
    });

    // Bracket time check valid datetime format
    $("form").on("keyup", "input.bracket-time", function() {
        var re = /\d{1,2}\/\d{1,2}\/\d{4} \d{1,2}:\d{2}(am|AM|pm|PM)/;
        var match = $(this).val().match(re)
        if (match && match.index === 0) {
            return $(this).parent().parent().next().addClass("hide-this")
                .parent().parent().parent().prev().removeClass('danger');
        }
        else {
            return $(this).parent().parent().next().removeClass("hide-this")
                .parent().parent().parent().prev().addClass('danger');
        }
    });

    // Hiding/ Showing +Round table based on Division Name blankness

    $('form').on('click', '.new-division-link', function() {
        if ($(this).parent().parent().next().children().children('.row').children('.division-name').children('.tournament_divisions_name').children('div').children().val() === "") {
            return $(this).parent().parent().next().children().children('table').addClass('hide-table');
        }
    });

    $("form").on("keyup", "input[placeholder=\"Division Name\"]", function() {
        // Not blank: unhide Rounds table, update division name in Header
        if ($(this).val() !== "") {
            $(this).first().parent().parent().parent().parent().next().next().removeClass("hide-table");
            $(this).last().parent().parent().parent().parent().parent().parent().prev().children('h4').children('a').text($(this).val());
        }
        // Blank: hide Rounds table, name Header 'Unnamed Division (will be deleted)'
        if ($(this).val() === "") {
            $(this).first().parent().parent().parent().parent().next().next().addClass("hide-table");
            $(this).last().parent().parent().parent().parent().parent().parent().prev().children('h4').children('a').text('Unnamed Division (will be deleted)');
        }
    });

    // Counter

    if ($('#hours-start').text() !== "") {
        hh = $('#hours-start').text();
        mm = $('#minutes-start').text();
        ss = $('#seconds-start').text();
        counter_time = hh + ":" + mm + ":" +ss;
        $(".digits").countdown({
            image: "countdown/digits.png",
            format: "hh:mm:ss",
            startTime: counter_time
        });

    }
    // Tabs

    $('#tabs a').click(function (e) {
        e.preventDefault()
        $(this).tab('show')
    })


    // Get IP

    if($('#user').length > 0) {
        $.ajax({
            dataType: 'json',
            url: 'http://jsonip.com',
            success: function(result) {
                $.ajax({
                    type: 'POST',
                    url: '/update-ip',
                    beforeSend:function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
                    dataType: 'json',
                    data: {ip: result.ip, id: $('#user').data('user')},
                    success: console.log('IP updated')
                });
                console.log('IP is ' + result.ip);
            }
        });
    }


    // Self-Summary Save

    $('.save').click(function(e){
        var summary = $(this).parent().parent().prev().html();
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: "/submit-summary",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            dataType: "json",
            data: {summary: summary, id: $(this).data('user')},
            success: $(this).after('<span class="saved">...saved</span>').fadeIn()
        });
        $('.saved').delay(2000).fadeOut();
    });

    // Self-Summary Reset

    $('.reset').click(function(e){
        e.preventDefault();
        $.ajax({
            type: "POST",
            url: "/submit-summary",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            dataType: "json",
            data: {summary: "", id: $(this).data('user')},
            success: $(this).after('<span class="saved">...cleared</span>').fadeIn()
        })                                                                         ;
        $('.self-summary').text('');
        $('.saved').delay(2000).fadeOut();
    })

    // Social Media Edit/Add Links
    $('.save-social-media').click(function(e){
        e.preventDefault();
        $('.social-media-edit-form').fadeToggle();
    })

    // Judging Paradigm Check Experience checkboxes
    var experiences = $('#experience-string').text().split(',');
    for (var i=0; i < experiences.length; i++) {
        $('.judge_experience input[value="' + experiences[i] + '"]').prop('checked',true);
    }

    // Join or leave a team, AJAX

    function joinTeam(join) {
        $.ajax({
            type: "POST",
            url: "/join-team",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            dataType: "json",
            data: {user_id: join.data('user'), id: join.data('team')},
            success: join.text('leave').removeClass('join').addClass('leave')
    });
    }

    function leaveTeam(el) {
        $.ajax({
            type: "POST",
            url: "/leave-team",
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            dataType: "json",
            data: {user_id: el.data('user'), id: el.data('team')},
            success: el.text('join').removeClass('leave').addClass('join')
        });
    }

    function showTeam(el, id) {
        var id = el.data('team')
        var url = '/teams/' + id
        $.ajax({
            type: "GET",
            url: url,
            beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
            dataType: "html",
            success: function(result){
                console.log(result)
            }
        });
    }

    $('.links').on('click', '.join', function(e) {
        e.preventDefault();
        var join = $(this);
        $.when(joinTeam(join)).then(function(){
            join.parent().parent().css('background-color','#FFFFBE')
        })


    })

    $('.links').on('click', '.leave', function(e) {
        e.preventDefault();
        var leave = $(this);
        $.when(leaveTeam(leave)).then(function(){
            leave.parent().parent().css('background-color','white')
        })
    })

    $('.links').on('click', '.hide-link', function(e){
        e.preventDefault()

    })





});


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
//= require_tree .
//= require twitter/bootstrap




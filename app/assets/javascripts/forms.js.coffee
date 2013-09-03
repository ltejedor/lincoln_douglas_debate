jQuery ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.remove_fields_division', (event) ->
    $(this).next().next().removeClass('hide-this')
    event.preventDefault()

# - Bracket
  $('form').on 'click', '.remove_fields_brackets', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).parent().parent().hide()
    event.preventDefault()

  $('form').on 'click', '.remove_fields_in_table', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).parent().parent().closest('fieldset').hide()
    event.preventDefault()

# +Division

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time).replace(/dynamic_time/g,time))
    event.preventDefault()

# +Round

  $('form').on 'click', '.add_fields_in_table', (event) ->
    time = new Date().getTime()
    num = $(this).last().parent().parent().index()
    uniqueID = time + '-' + num
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).parent().parent().before($(this).data('fields').replace(regexp, uniqueID).replace(/dynamic_time/g,uniqueID))
    event.preventDefault()

# Round collapse, unique ID fix for +Rounds in New Divisions

  $('form').on 'click', '.round-row', (event) ->
    time = new Date().getTime()
    $(this).attr('data-target','#round-'+time)
    $(this).next().attr('id','round-'+time)

# Round editing live-update

  $('form').on 'change', '.round-kind', (event) ->
    $(this).parent().parent().parent().parent().prev().children().first().next().removeClass('bracket-filler').html('<b>'+$(this).val()+'</b>')

# +Bracket

  $('form').on 'click.current', '.add_fields_in_row', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).parent().before($(this).data('fields').replace(regexp, time).replace(/dynamic_time/g,time))
    event.preventDefault()

# Bracket time -- check valid datetime format

  $("form").on "keyup", "input.bracket-time", ->
    re = /\d{1,2}\/\d{1,2}\/\d{4} \d{1,2}:\d{2}(am|AM|pm|PM)/
    if $(this).val().match(re)
      $(this).parent().parent().next().addClass "hide-this"
    else
      $(this).parent().parent().next().removeClass "hide-this"



# Hiding or showing +Round table based on Division Name blank or not

  $('form').on 'click', '.new-division-link', () ->
    $(this).parent().parent().next().children().children('table').addClass('hide-table') if $(this).parent().parent().next().children().children('.row').children('.division-name').children('.tournament_divisions_name').children('div').children().val() == ""

  $("form").on "keyup", "input[placeholder=\"Division Name\"]", () ->

    # Unhide or hide Rounds table

    $(this).first().parent().parent().parent().parent().next().next().removeClass("hide-table") if $(this).val() != ""
    $(this).first().parent().parent().parent().parent().next().next().addClass("hide-table") if $(this).val() == ""

    # Update Division name in Header

    $(this).last().parent().parent().parent().parent().parent().parent().prev().children('h4').children('a').text('Unnamed Division (will be deleted)') if $(this).val() == ""
    $(this).last().parent().parent().parent().parent().parent().parent().prev().children('h4').children('a').text($(this).val()) if $(this).val() != ""




# Bracket removal and addition based on round kind.
# Deprecated feature. (Round kind now defaults to 'Unpowered Prelim')

  $('form').on 'click', '.round-row', () ->
    $(this).next().children('td').last().removeClass('hide-this') if $(this).next().children().first().next().children('.select').children().children().val()!= ""

  $('form').on 'change', '.round-kind', () ->
    $(this).parent().parent().parent().parent().children('.new-bracket-link').removeClass('hide-this') if $(this).val() != ""
    $(this).parent().parent().parent().parent().children('.new-bracket-link').addClass('hide-this') if $(this).val() == ""
    $(this).parent().parent().parent().parent().children('td').children('fieldset').hide() if $(this).val() == ""

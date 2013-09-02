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
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).parent().parent().before($(this).data('fields').replace(regexp, time).replace(/dynamic_time/g,time))
    event.preventDefault()

# +Bracket

  $('form').on 'click.current', '.add_fields_in_row', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).parent().before($(this).data('fields').replace(regexp, time).replace(/dynamic_time/g,time))
    event.preventDefault()


# Hiding or showing +Round table based on Division Name blank or not

  $('form').on 'click', '.new-division-link', (event) ->
    $(this).parent().parent().next().children().children('table').addClass('hide-table')

  $("form").on "keyup", "input[placeholder=\"Division Name\"]", (event) ->
    $(this).first().parent().parent().parent().parent().next().next().removeClass "hide-table"
    time = new Date().getTime()
    console.log('Keyed up ' + time)

# Bracket removal and addition based on round kind.
# Deprecated feature. (Round kind now defaults to 'Unpowered Prelim')

  $('form').on 'click', '.round-row', (event) ->
    $(this).next().children('td').last().removeClass('hide-this') if $(this).next().children().first().next().children('.select').children().children().val()!= ""

  $('form').on 'change', '.round-kind', (event) ->
    $(this).parent().parent().parent().parent().children('.new-bracket-link').removeClass('hide-this') if $(this).val() != ""
    $(this).parent().parent().parent().parent().children('.new-bracket-link').addClass('hide-this') if $(this).val() == ""
    $(this).parent().parent().parent().parent().children('td').children('fieldset').hide() if $(this).val() == ""





jQuery ->
  $(".alert a.close").bind 'click', (event) ->
    $(this).parent().slideUp('slow')
    event.preventDefault()
    false

  $("input.datepicker").each (i) ->
    $(this).datepicker
      altFormat: "yy-mm-dd"
      dateFormat: "dd/mm/yy"
      altField: $(this).next()

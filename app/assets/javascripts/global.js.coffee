jQuery ->
  $(".alert a.close").click ->
    $('.alert a.close').parent().slideUp('slow')
    return false 

  $("input.datepicker").each (i) ->
    $(this).datepicker
      altFormat: "yy-mm-dd"
      dateFormat: "dd/mm/yy"
      altField: $(this).next()

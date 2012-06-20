# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('input[id*="participant_name"]').autocomplete
    source: $('input[id*="participant_name"]').data('autocomplete-source')

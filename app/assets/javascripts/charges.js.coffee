# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('select#customer_country').change (event) ->
    select_wrapper = $('#customer_state_code_wrapper')

    $('select', select_wrapper).attr('disabled', true)

    parent_region = $(this).val()
    $.ajax
      url: "/customers/subregion_select",
      type: "POST"
      data: {"parent_region": parent_region}

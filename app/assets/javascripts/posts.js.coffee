# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#word_text').on 'keyup', ->
    $('#list, #alert').html ''
    if $(@).val() != ''
      $.ajax '/words/get_list',
        type: 'GET'
        dataType: 'json'
        data:
          word: $('#word_text').val()
        success: (data, status, jqXHR) ->
          for i, item of data
            $('#list').append "<div>#{item.text}</div>"
          if !data.length
            $('#list').append 'Not found'
  $('input[type="submit"]').on 'click', (e) ->
    e.preventDefault()
    $.ajax '/words/',
      type: 'POST'
      dataType: 'json'
      data:
        word:
          text: $('#word_text').val()
      success: (data, status, jqXHR) ->
        $('#alert').html('Value was added')
        $('#alert').css('color', 'green')
      error: (data, status, jqXHR) ->
        $('#alert').html('Value already was added')
        $('#alert').css('color', 'red')

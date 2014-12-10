# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#submit").click ->
    # hide the results at first
    $("p.results").hide().empty()

    # grab the input value and store in variable
    term = $("#term").val()
    console.log "The value of term is: " + term
    $("span.highlight").each ->
      $(this).after($(this).html()).remove()

    if $("#term").val() is ""
      $("p.results").fadeIn().append "Enter term in field above"
      $("#term").fadeIn().addClass "error"
    else
      $("div.container :contains(\"" + term + "\")").each ->
        $(this).html $(this).html().replace(new RegExp(term, "g"), "<span class=\"highlight\">" + term + "</span>")

      n = $("span.highlight").length
      console.log "The there is a total of: " + n
      if n is 0
        $("p.results").fadeIn().append "No results were returned"
      else
        $("p.results").fadeIn().append "<b>Returned:</b> " + n + " result(s) for the search term of: <i><b>" + term + "</b></i>."

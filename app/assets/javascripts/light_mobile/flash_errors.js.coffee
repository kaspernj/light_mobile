$ ->
  $(".mobile-flash-ok").click (e) ->
    e.preventDefault()
    parent_flash = $(this).parent(".mobile-flash")
    parent_flash.remove()

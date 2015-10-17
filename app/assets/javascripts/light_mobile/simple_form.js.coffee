$ ->
  # Makes it possible to change the background-color when checked
  $(".simple_form .input.check_boxes span.checkbox input[type=checkbox]").on "click", ->
    check_box = $(this)
    container = check_box.parents("span.checkbox").first()

    if check_box.is(":checked")
      container.addClass("light-mobile-checked")
    else
      container.removeClass("light-mobile-checked")

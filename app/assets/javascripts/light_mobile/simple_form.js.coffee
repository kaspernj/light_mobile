$ ->
  # Makes it possible to change the background-color when checked
  $(".simple_form .input.check_boxes span.checkbox input[type=checkbox], .simple_form .input.radio_buttons span.radio input[type=radio], .simple_form .input.boolean input[type=checkbox]").on "click", ->
    check_box = $(this)

    if check_box.hasClass("radio_buttons")
      inputs_container = check_box.parents("div.radio_buttons").first()

      containers = $("span.radio", inputs_container)
      containers.removeClass("light-mobile-checked")

    container = check_box.parents("span.checkbox, span.radio, div.input.boolean").first()

    if check_box.is(":checked")
      container.addClass("light-mobile-checked")
    else
      container.removeClass("light-mobile-checked")

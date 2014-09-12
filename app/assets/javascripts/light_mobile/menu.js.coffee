$ ->
  $(".mobile-menu-button").click ->
    left_menu = $(".mobile-left-menu")

    if left_menu.data("shown")
      $(".mobile-menu-button").animate({"margin-left": 0}, "fast")
      left_menu.animate({width: 1}, "fast", ->
        left_menu.hide()
        left_menu.data("shown", false)
      )
    else
      $(".mobile-menu-button").animate({"margin-left": "154px"}, "fast")
      left_menu.show()
      left_menu.animate({width: "150px"}, "fast", ->
        left_menu.data("shown", true)
      )

$ ->
  $("table.mobile-tabs").each ->
    lightMobileInitTabs($(this))

lightMobileInitTabs = (tabs) ->
  tds = $("tbody > tr > td", tabs)

  tds.click (e) ->
    lightMobileActivateTab(tabs, $(this))

  if match = location.hash.match(/^#mobile-tab-(.+)$/)
    mobile_tab_active = match[1]

  tds.each ->
    tab = $(this)
    active_tab = false

    container = $("#" + tab.data("tab"))
    container.addClass("mobile-tabs-container")

    if mobile_tab_active
      active_tab = true if mobile_tab_active == tab.data("tab")
    else if tab.hasClass("mobile-tab-active")
      active_tab = true

    if active_tab
      tab.addClass("mobile-tab-active")
      container.addClass("mobile-tabs-container-active")
    else
      tab.removeClass("mobile-tab-active")

lightMobileActivateTab = (tabs, tab) ->
  active_tab = $("> tbody > tr > td.mobile-tab-active", tabs)
  active_tab.removeClass("mobile-tab-active")
  tab.addClass("mobile-tab-active")

  active_container = $("#" + active_tab.data("tab"))
  active_container.removeClass("mobile-tabs-container-active")

  new_container = $("#" + tab.data("tab"))
  new_container.addClass("mobile-tabs-container-active")

  location.hash = "mobile-tab-" + tab.data("tab")

$ ->
  # Initialize all tabs-elements.
  $("table.mobile-tabs").each -> lightMobileInitTabs($(this))

  # Refresh active tab on back-events.
  $(window).on "hashchange", -> $("table.mobile-tabs").each -> lightMobileRefreshActiveTab($(this))

lightMobileInitTabs = (tabs) ->
  return if tabs.data("initialized") == "true"
  tabs.data("initialized", "true")

  tds = $("tbody > tr > td", tabs)
  tds.click (e) -> lightMobileActivateTab(tabs, $(this))

  lightMobileRefreshActiveTab(tabs)

lightMobileRefreshActiveTab = (tabs) ->
  if match = location.hash.match(/^#mobile-tab-(.+)$/)
    mobile_tab_active = match[1]

  tds = $("tbody > tr > td", tabs)
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
      container.removeClass("mobile-tabs-container-active")

lightMobileActivateTab = (tabs, tab) ->
  # Changing the hash fires an event that updates the active tab.
  location.hash = "mobile-tab-" + tab.data("tab")

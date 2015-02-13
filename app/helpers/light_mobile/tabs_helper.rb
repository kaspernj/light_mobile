module LightMobile::TabsHelper
  def mobile_tabs(args = {})
    tabs = LightMobile::Tabs.new(args)
    yield tabs
    return tabs.to_html
  end
end

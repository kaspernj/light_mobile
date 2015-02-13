class LightMobile::Tabs
  def initialize(args)
    @tabs = []
  end

  def tab(args)
    @tabs << args
  end

  def to_html
    table = ::HtmlGen::Element.new(:table, classes: ["mobile-tabs"])
    tr = table.add_ele(:tbody).add_ele(:tr)

    @tabs.each do |tab|
      td = tr.add(:td)

      td.classes << "mobile-tab-active" if tab[:active]
      td.data[:tab] = tab[:id]

      if tab[:icon]
        td.css["background-image"] = "url('#{tab[:icon]}')"
        td.classes << "mobile-tab-icon"
      end

      td.add_str tab[:label] if tab[:label]
    end

    table.html.html_safe
  end
end

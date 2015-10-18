module LightMobile::DynamicRenderer
  # In order to only render mobile views if they exist.
  def render(*args, &blk)
    if request.user_agent && view_context.agent_mobile? && (session[:light_mobile_version].to_s == "mobile" || !session[:light_mobile_version].present?)
      render_mobile = true
    elsif params[:mobile].to_s == '1'
      render_mobile = true
    end

    if render_mobile
      name = args[0]
      name = action_name.to_sym if !name.is_a?(Symbol) && !name.is_a?(String)

      if name.is_a? Symbol
        if light_mobile_view_exists?(name)
          request.format = :mobile
          self.formats = [:mobile, :html]
        end
      end
    end

    return super
  end

private

  def light_mobile_view_exists?(name)
    @@light_mobile_view_cache ||= {}

    unless Rails.env.development?
      result = @@light_mobile_view_cache[controller_name].try(:[], action_name).try(:[], name)
    end

    result = light_mobile_generate_view_cache(name) if result == nil

    return result
  end

  def light_mobile_generate_view_cache(name)
    @@light_mobile_view_cache[controller_name] ||= {}
    @@light_mobile_view_cache[controller_name][action_name] ||= {}

    view_paths.each do |view_path|
      ActionView::Template::Handlers.extensions.each do |handler|
        full_path = "#{view_path}/#{controller_path}/#{name}.mobile.#{handler}"

        next unless File.exists?(full_path)
        return @@light_mobile_view_cache[controller_name][action_name][name] = true
      end
    end

    return @@light_mobile_view_cache[controller_name][action_name][name] = false
  end
end

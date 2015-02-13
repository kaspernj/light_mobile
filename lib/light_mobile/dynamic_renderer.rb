module LightMobile::DynamicRenderer
  # In order to only render mobile views if they exist.
  def render(*args, &blk)
    if request.user_agent && view_context.agent_mobile? && (session[:light_mobile_version].to_s == "mobile" || !session[:light_mobile_version].present?)
      name = args[0]
      name = action_name.to_sym if !name.is_a?(Symbol) && !name.is_a?(String)

      if name.is_a? Symbol
        view_paths.each do |view_path|
          ActionView::Template::Handlers.extensions.each do |handler|
            full_path = "#{view_path}/#{controller_path}/#{name}.mobile.#{handler}"
            next unless File.exists? full_path
            request.format = :mobile
            self.formats = [:mobile, :html]
          end
        end
      end
    end

    super
  end
end

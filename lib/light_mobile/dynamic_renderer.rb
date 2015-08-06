module LightMobile::DynamicRenderer
  # In order to only render mobile views if they exist.
  def render(*args, &blk)
    if request.user_agent && view_context.agent_mobile? && (session[:light_mobile_version].to_s == "mobile" || !session[:light_mobile_version].present?)
      render_mobile = true
    elsif params[:mobile].to_s == '1'
      render_mobile = true
    end

    if render_mobile
      puts "RenderMobile: #{render_mobile}"

      name = args[0]
      name = action_name.to_sym if !name.is_a?(Symbol) && !name.is_a?(String)

      if name.is_a? Symbol
        view_paths.each do |view_path|
          ActionView::Template::Handlers.extensions.each do |handler|
            full_path = "#{view_path}/#{controller_path}/#{name}.mobile.#{handler}"
            puts "TestingFullPath: #{full_path}"

            next unless File.exists?(full_path)

            puts "RENDER AS MOBILE!"
            request.format = :mobile
            self.formats = [:mobile, :html]
            break
          end

          puts "DONT RENDER AS MOBILE!" unless request.format == :mobile
        end
      end
    end

    super
  end
end

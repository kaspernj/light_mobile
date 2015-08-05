require "light_mobile/engine"
require "html_gen"
require "agent_helpers"

module LightMobile
  def self.const_missing(name)
    file_name = "#{::File.dirname(__FILE__)}/light_mobile/#{::StringCases.camel_to_snake(name)}.rb"

    if ::File.exists?(file_name)
      require file_name
      return ::LightMobile.const_get(name) if ::LightMobile.const_defined?(name)
    end

    super
  end
end

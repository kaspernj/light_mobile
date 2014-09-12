$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "light_mobile/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "light_mobile"
  s.version     = LightMobile::VERSION
  s.authors     = ["Kasper Johansen"]
  s.email       = ["k@spernj.org"]
  s.homepage    = "https://www.github.com/kaspernj/light_mobile"
  s.summary     = "Lightweight UI for mobile Rails apps."
  s.description = "Lightweight UI for mobile Rails apps."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
end

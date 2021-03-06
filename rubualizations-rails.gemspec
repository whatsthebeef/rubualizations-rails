$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rubualizations/rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rubualizations-rails"
  s.version     = Rubualizations::Rails::VERSION
  s.authors     = ["John Bower"]
  s.email       = ["john@zode64.com"]
  s.homepage    = "http://www.zode64.com"
  s.summary     = "Rails gem that creates a google visualization data source from ActiveRecord models passed to it."
  s.description = "Rails gem that creates a google visualization data source from ActiveRecord models passed to it."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 2.2.1"
  s.add_dependency "rubualizations"
end

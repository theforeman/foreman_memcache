$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "foreman_memcache/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "foreman_memcache"
  s.version     = ForemanMemcache::VERSION
  s.authors     = ["Ohad Levy"]
  s.email       = ["ohadlevy@gmail.com"]
  s.homepage    = "http://theforeman.org"
  s.summary     = "Adds memcache integeration to foreman"
  s.description = "adds memcache support to foreman"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.13"
  s.add_dependency "dalli"
end

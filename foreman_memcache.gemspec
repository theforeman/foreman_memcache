require File.expand_path('../lib/foreman_memcache/version', __FILE__)
require 'date'

Gem::Specification.new do |s|
  s.name        = "foreman_memcache"
  s.version     = ForemanMemcache::VERSION
  s.authors     = ["Ohad Levy"]
  s.email       = ["ohadlevy@gmail.com"]
  s.homepage    = "http://theforeman.org"
  s.summary     = "Adds memcache integeration to foreman"
  s.description = "adds memcache support to foreman"
  s.licenses    = ["GPL-3"]

  s.files = Dir["{app,config,db,lib}/**/*"] + ["LICENSE", "Rakefile", "README.md", "foreman_memcache.yaml.example"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "dalli"
  s.add_dependency 'deface'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rdoc'
end

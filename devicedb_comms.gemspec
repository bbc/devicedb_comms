$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "devicedb_comms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "devicedb_comms"
  s.version     = DeviceDBComms::VERSION
  s.authors     = ["Joe Haig"]
  s.email       = ["joe.haig@bbc.co.uk"]
  s.homepage    = "https://github.com/bbc/devicedb_comms"
  s.summary     = "DeviceDB Comms Gem"
  s.description = "Communication helper gem for talking to Device Database"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]
  s.add_runtime_dependency 'activesupport', '>= 4.0', '< 4.3'
  s.add_runtime_dependency 'virtus', '~> 1.0'
  s.add_development_dependency 'rspec', '~> 3.2'
  s.add_development_dependency 'webmock', '~> 1.20'
  s.add_development_dependency 'simplecov', '~> 0.9'
end

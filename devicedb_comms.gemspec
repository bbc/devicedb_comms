$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "devicedb_comms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "devicedb_comms"
  s.version     = DeviceDBComms::VERSION
  s.authors     = ["Matt Lafferty", "Joe Haig"]
  s.email       = ["matt@exhib.it", "joe.haig@bbc.co.uk"]
  s.homepage    = "http://exhib.it"
  s.summary     = "DeviceDB Comms Gem"
  s.description = "Communication helper gem for talking to Device Database"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]
end

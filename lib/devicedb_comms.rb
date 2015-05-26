require 'virtus'

require 'devicedb_comms/queue'
require 'devicedb_comms/device'
require 'devicedb_comms/hive'
require 'devicedb_comms/configuration'

module DeviceDBComms
  class << self
    attr_accessor :configuration

    def configure
      self.configuration = Configuration.new
      yield(configuration)
    end
  end
end

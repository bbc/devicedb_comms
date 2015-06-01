require 'virtus'

require 'devicedb_comms/queue'
require 'devicedb_comms/device'
require 'devicedb_comms/hive'
require 'devicedb_comms/configuration'

module DeviceDBComms
  class << self
    # TODO Add this accessor when the configuration method is removed
    #attr_accessor :configuration

    def configure
      self.configuration = Configuration.new
      yield(configuration)
    end

    # For backward compatibility
    # TODO Remove this as the configure method must be called
    def configuration
      @configuration ||= Configuration.new
    end
  end
end

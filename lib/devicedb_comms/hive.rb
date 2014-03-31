require 'devicedb_comms/shared'

module DeviceDBComms
  class Hive < DeviceDBComms::Shared

    def register(device_params)
      post("/hives/register", device_params)
    end

  end
end

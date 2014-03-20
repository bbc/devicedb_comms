require 'devicedb_comms/shared'

module DeviceDBComms
  class Device < DeviceDBComms::Shared

    def register(device_params)
      post("/devices/register", device_params)
    end

    def poll(device_id, status=nil)
      post("/devices/#{device_id}/poll" + ( "(/#{status}" if status.present? ))
    end

    def hive_connect(device_id, hive_id)
      post("/hives/#{hive_id}/devices/#{device_id}/connect")
    end

    def hive_disconnect(device_id)
      put("/hives/devices/#{device_id}/disconnect")
    end

  end
end

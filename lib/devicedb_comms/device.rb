require 'devicedb_comms/shared'

module DeviceDBComms
  class Device < DeviceDBComms::Shared

    attr_accessor :application

    def find(device_id)
      get("/devices/#{device_id}")
    end

    def register(device_params)
      post("/devices/register", device_params)
    end

    def poll(device_id, status=nil)
      post("/devices/#{device_id}/poll" \
              + ( "/#{status}" unless status.nil? ).to_s \
              + ( "?application=#{@application}" unless @application.nil?).to_s)
    end

    def hive_connect(device_id, hive_id)
      post("/hives/#{hive_id}/devices/#{device_id}/connect")
    end

    def hive_disconnect(device_id)
      put("/hives/devices/#{device_id}/disconnect")
    end

    def action(device_id, type, body)
      post("/devices/#{device_id}/new_action", { action_type: type, action_body: body })
    end

    def find_disconnected_by_type(type)
      post("/devices/search", { device_type: type, hive_id: -1, status: 'idle' })
    end

  end
end

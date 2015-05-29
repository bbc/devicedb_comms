require 'devicedb_comms/shared'

module DeviceDBComms
  class Device < DeviceDBComms::Shared

    # Backward compatibility with version <= 0.0.14
    # TODO Remove arguments
    def initialize(url = nil, pem_path = nil)
      @applications = {}
      super(url, pem_path)
    end

    def find(device_id)
      get("/devices/#{device_id}")
    end

    def register(device_params)
      post("/devices/register", device_params)
    end

    def poll(device_id, status=nil)
      params = {}
      if @applications[device_id]
        params['application'] = @applications[device_id]
      end
      post("/devices/#{device_id}/poll" + ( "/#{status}" unless status.nil? ).to_s, params)
    end

    def set_application(device_id, name=nil)
      @applications[device_id] = name
      poll(device_id)
    end

    def clear_application(device_id)
      set_application(device_id, nil)
    end

    def get_application(device_id)
      find(device_id)['application']
    end

    def hive_connect(device_id, hive_id)
      post("/hives/#{hive_id}/devices/#{device_id}/connect")
    end

    def hive_disconnect(device_id)
      put("/hives/devices/#{device_id}/disconnect")
    end

    def action(device_id, type, body, tries = 1)
      rtn = { 'error' => 'No tries' }
      n = 0
      while n < tries && rtn.has_key?('error')
        rtn = post("/devices/#{device_id}/new_action", { action_type: type, action_body: body })
        n += 1
      end
      rtn
    end

    def find_disconnected_by_type(type)
      {
        'devices' => []
      }.merge(post("/devices/search", { device_type: type, hive_id: -1, status: 'idle' }))
    end

  end
end

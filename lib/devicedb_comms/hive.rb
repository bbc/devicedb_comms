require 'devicedb_comms/shared'

module DeviceDBComms
  class Hive < DeviceDBComms::Shared

    def register(hive_name, mac_address, ip_address)
      post("/hives/register", { hive: { hostname: hive_name, mac: mac_address, ip_address: ip_address }})
    end

    def poll(hive_id)
      post("/hives/#{hive_id}/poll")
    end

  end
end

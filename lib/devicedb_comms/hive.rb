require 'devicedb_comms/shared'

module DeviceDBComms
  class Hive < DeviceDBComms::Shared

    def register(hive_name, hive_description, mac_address, ip_address)
      post("/hives/register", { hive: { name: hive_name, description: hive_description, mac: mac_address, ip_address: ip_address }})
    end

  end
end

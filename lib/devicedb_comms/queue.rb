require 'devicedb_comms/shared'

module DeviceDBComms
  class Queue < DeviceDBComms::Shared

    def find_by_name(name)
      get("/queues/by_name/#{name}")
    end

    def find(id)
      get("/queues/#{id}")
    end

    def register(queue_params)
      post("/queues", queue_params)
    end
  end
end

require 'devicedb_comms/shared'

module DeviceDBComms
  class Queue < DeviceDBComms::Shared

    def find_by_name(name)
      get("/queues/by_name/#{name}")
    end

    #def start(job_id)
    #  put("jobs/#{job_id}/start")
    #end
    #
    #def end(job_id)
    #  put("jobs/#{job_id}/end")
    #end
    #
    #def error(job_id)
    #  put("jobs/#{job_id}/error")
    #end
    #
    #def update(job_id, params)
    #  put("jobs/#{job_id}", params)
    #end

  end
end

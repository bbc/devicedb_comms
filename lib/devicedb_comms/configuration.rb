module DeviceDBComms
  class Configuration
    include Virtus.model

    attribute :url, String
    attribute :pem_file, String
    attribute :ssl_verify_mode, Integer, default: OpenSSL::SSL::VERIFY_PEER
  end
end

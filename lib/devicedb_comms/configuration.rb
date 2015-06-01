module DeviceDBComms
  class Configuration
    include Virtus.model

    attribute :url, String
    attribute :pem_file, String
    # Backward compatibility with version <= 0.0.14
    # TODO Change default to VERIFY_PEER
    attribute :ssl_verify_mode, Integer, default: OpenSSL::SSL::VERIFY_NONE
  end
end

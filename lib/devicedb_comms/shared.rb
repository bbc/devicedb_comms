require 'active_support/core_ext/object/to_query'
require 'json'
require 'net/http'

module DeviceDBComms
  class Shared

    def initialize
      uri = URI.parse(DeviceDBComms.configuration.url)

      @http = Net::HTTP.new(uri.host, uri.port)

      if DeviceDBComms.configuration.pem_file
        pem = File.read(DeviceDBComms.configuration.pem_file)
        @http.use_ssl = true if uri.scheme == 'https'
        @http.cert = OpenSSL::X509::Certificate.new(pem)
        @http.key = OpenSSL::PKey::RSA.new(pem)
        @http.verify_mode = DeviceDBComms.configuration.ssl_verify_mode
      end
    end

    def get(call)
      begin
        parse_response @http.request_get(call + '.json')
      rescue StandardError => e
        { 'error' => "GET failed: #{e.message}" }
      end
    end

    def post(call, params={})
      begin
        parse_response @http.request_post(call + '.json', to_query(params))
      rescue StandardError => e
        { 'error' => "POST failed: #{e.message}" }
      end
    end

    def put(call, params={})
      begin
        parse_response @http.request_put(call + '.json', to_query(params))
      rescue StandardError => e
        { 'error' => "PUT failed: #{e.message}" }
      end
    end

    def parse_response(response)
      JSON.parse(response.body)
    end

    def to_query(params_hash)
      params_hash.to_query
    end

  end
end

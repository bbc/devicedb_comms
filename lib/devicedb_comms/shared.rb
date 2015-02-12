module DeviceDBComms
  class Shared

    def initialize(url, pem_path=nil)
      uri = URI.parse(url)

      @http = Net::HTTP.new(uri.host, uri.port)

      if pem_path
        pem = File.read(pem_path)
        @http.use_ssl = true if uri.scheme == 'https'
        @http.cert = OpenSSL::X509::Certificate.new(pem)
        @http.key = OpenSSL::PKey::RSA.new(pem)
        @http.verify_mode = OpenSSL::SSL::VERIFY_NONE
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

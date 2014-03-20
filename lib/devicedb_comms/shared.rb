module DeviceDBComms
  class Shared

    def initialize(url, pem_path=nil)
      uri = URI.parse(url)

      @http = Net::HTTP.new(uri.host, uri.port)

      if pem_path
        pem = File.read(pem_path)
        @http.use_ssl = true
        @http.cert = OpenSSL::X509::Certificate.new(pem)
        @http.key = OpenSSL::PKey::RSA.new(pem)
        @http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
    end

    def get(call)
      parse_response @http.request_get(call)
    end

    def post(call, params={})
      parse_response @http.request_post(call, to_query(params))
    end

    def put(call, params={})
      parse_response @http.request_put(call, to_query(params))
    end

    def parse_response(response)
      JSON.parse(response.body)
    end

    def to_query(params_hash)
      puts "&"*50
      puts "&&& params_hash: #{params_hash}"
      puts "&&& params_hash_mapped: #{params_hash.map{ |k, v| "#{k}=#{v}" }.join('&')}"
      puts "&"*50
      params_hash.map{ |k, v| "#{k}=#{v}" }.join('&')
    end

  end
end

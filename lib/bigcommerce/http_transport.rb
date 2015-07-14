require 'json'

module Bigcommerce
  # class PathBuilder
  #   attr_reader :uri
  #
  #   def initialize(uri)
  #     @uri = uri
  #   end
  #
  #   # This takes the @uri and inserts the keys to form a path.
  #   # To start we make sure that for nil/numeric values, we wrap those into an
  #   # array. We then scan the string for %d and %s to find the number of times
  #   # we possibly need to insert keys into the URI. Next, we check the size of
  #   # the keys array, if the keys size is less than the number of possible keys
  #   # in the URI, we will remove the trailing %d or %s, then remove the
  #   # trailing /. We then pass the keys into the uri to form the path.
  #   # ex. foo/%d/bar/%d => foo/1/bar/2
  #   def build(keys = [])
  #     keys = [] if keys.nil?
  #     keys = [keys] if keys.is_a? Numeric
  #     ids = uri.scan('%d').count + uri.scan('%s').count
  #     str = ids > keys.size ? uri.chomp('%d').chomp('%s').chomp('/') : uri
  #     (str % keys).chomp('/')
  #   end
  #
  #   def to_s
  #     @uri
  #   end
  # end

  class HttpTransport
    # def included(base)
    #   base.extend ClassMethods
    #   path_builder = PathBuilder.new @uri
    #   base.define_singleton_method :path do
    #     path_builder
    #   end
    # end
    attr_reader :config

    def initialize
      @config = Hashie::Mash.new
      yield(@config) if block_given?
    end

    def get(path, params = nil)
      parse raw_request(:get, path, params).body
    end

    def delete(path)
      parse raw_request(:delete, path).body
    end

    def post(path, params)
      parse raw_request(:post, path, params).body
    end

    def put(path, params)
      parse raw_request(:put, path, params).body
    end

    def raw_request(method, path, params = nil)
      response = connection.send(method, path.to_s, params)
      Bigcommerce.api_limit = response.headers['X-BC-ApiLimit-Remaining']

      response
    end

    def connection
      ssl_options = config.ssl if config.auth == 'legacy'
      headers = Bigcommerce::HEADERS
      @connection ||= Faraday.new(url: build_url, ssl: ssl_options) do |conn|
        conn.request :json
        if config.auth == 'legacy'
          conn.basic_auth(config.username, config.api_key)
        else
          headers = headers.merge('X-Auth-Client' => config.client_id, 'X-Auth-Token' => config.access_token)
        end
        conn.headers = headers
      end
    end

    private

    def build_url
      return config.url if config.auth == 'legacy'
      "https://api.bigcommerce.com/stores/#{config.store_hash}/v2"
    end

    def parse(json)
      return [] if json.empty?
      JSON.parse(json, symbolize_names: true)
    end
  end
end

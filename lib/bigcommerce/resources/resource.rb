# require 'bigcommerce/subresource_actions'

module Bigcommerce
  class Resource < Hashie::Trash
    include Hashie::Extensions::MethodAccess
    include Hashie::Extensions::IgnoreUndeclared
    include ResourceActions
    attr_accessor :http_transport

    class << self
      attr_reader :endpoint
      def use_endpoint(str)
        @endpoint = str
      end

      def build_response_object(json)
        if json.is_a? Array
          json.map { |obj| new obj }
        else
          new json
        end
      end

      def instance(http_transport)
        obj = new
        obj.http_transport = http_transport
        obj
      end
    end
  end
end

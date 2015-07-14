# require 'bigcommerce/resource_actions'
# require 'bigcommerce/subresource_actions'

module Bigcommerce
  class Resource < Hashie::Trash
    include Hashie::Extensions::MethodAccess
    include Hashie::Extensions::IgnoreUndeclared

    class << self
      def build_response_object(json)
        if json.is_a? Array
          json.map { |obj| new obj }
        else
          new json
        end
      end
    end
  end
end

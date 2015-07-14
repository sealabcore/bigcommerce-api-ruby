require 'hashie'
require 'bigcommerce/version'
require 'bigcommerce/http_transport'
require 'bigcommerce/resource_actions'
require 'bigcommerce/resources/resource'

# resources = File.join(File.dirname(__FILE__), 'bigcommerce', 'resources', '**', '*.rb')
# Dir.glob(resources, &method(:require))
require 'bigcommerce/resources/store/store_information'
require 'bigcommerce/resources/orders/order'

module Bigcommerce

  HEADERS = { 'accept' => 'application/json',
              'content-type' => 'application/json',
              'user-agent' => 'bigcommerce-api-ruby' }.freeze

  class << self; attr_accessor :api_limit; end
end

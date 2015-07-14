# Shipping Method
# List of enabled shipping methods.
# https://developer.bigcommerce.com/api/stores/v2/shipping/methods

module Bigcommerce
  class ShippingMethod < Resource
    use_endpoint 'shipping/methods'

    property :id
    property :name
    property :method_name
  end
end

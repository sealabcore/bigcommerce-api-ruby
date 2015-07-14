# Tax Class
# Tax classes are used to apply different tax rates for specific types
# of products and orders.
# https://developer.bigcommerce.com/api/stores/v2/tax_classes

module Bigcommerce
  class TaxClass < Resource
    use_endpoint 'tax_classes'

    property :id
    property :name
  end
end

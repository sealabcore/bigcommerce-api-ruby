# Order Shipping Addresses
# Shipping addresses associated with an order.
# https://developer.bigcommerce.com/api/stores/v2/orders/shipping_addresses

module Bigcommerce
  class OrderTax < Resource
    include SubresourceActions
    use_endpoint 'orders/%d/taxes/%d'

    property :id
    property :order_id
    property :order_address_id
    property :tax_rate_id
    property :tax_class_id
    property :name
    property :tax_class, from: :class
    property :rate
    property :priority
    property :priority_amount
    property :line_amount
  end
end

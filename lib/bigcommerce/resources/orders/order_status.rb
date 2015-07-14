# Order Status
# Statuses that can be assigned to orders. Each status represents a state in
# the fulfilment workflow.
# https://developer.bigcommerce.com/api/stores/v2/order_statuses

module Bigcommerce
  class OrderStatus < Resource
    use_endpoint 'order_statuses'

    property :id
    property :name
    property :order
  end
end

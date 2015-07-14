# Payment Method
# Enabled payment methods.
# https://developer.bigcommerce.com/api/stores/v2/payments/methods

module Bigcommerce
  class PaymentMethod < Resource
    use_endpoint 'payments/methods'

    property :code
    property :name
    property :test_mode
  end
end

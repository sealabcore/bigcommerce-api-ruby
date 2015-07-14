# Order Coupon
# Coupons applied to an order.
# https://developer.bigcommerce.com/api/stores/v2/orders/coupons

module Bigcommerce
  class OrderCoupon < Resource
    include SubresourceActions
    use_endpoint 'orders/%d/coupons/%d'

    property :id
    property :coupon_id
    property :order_id
    property :code
    property :amount
    property :type
    property :type
    property :discount
  end
end

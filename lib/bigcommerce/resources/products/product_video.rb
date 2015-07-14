# Product Video
# Embedded videos displayed on product listings.
# https://developer.bigcommerce.com/api/stores/v2/products/videos

module Bigcommerce
  class ProductVideo < Resource
    include SubresourceActions
    use_endpoint 'products/%d/videos/%s'
    property :id
    property :product_id
    property :count
    property :url
    property :sort_order
    property :name

  end
end

# Product Option
# Options associated directly with a product.
# https://developer.bigcommerce.com/api/stores/v2/products/options

module Bigcommerce
  class ProductOption < Resource
    include SubresourceActions
    use_endpoint 'products/%d/options/%d'

    property :id
    property :option_id
    property :display_name
    property :sort_order
    property :is_required
  end
end

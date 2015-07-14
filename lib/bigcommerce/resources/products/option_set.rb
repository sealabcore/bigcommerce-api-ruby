# Option Set
# A reusable set of option facets that can be applied to products.
# https://developer.bigcommerce.com/api/stores/v2/options_sets

module Bigcommerce
  class OptionSet < Resource
    use_endpoint 'option_sets'
    property :id
    property :name
    property :count
    property :options

    # def self.count
    #   get 'option_sets/count'
    # end
  end
end

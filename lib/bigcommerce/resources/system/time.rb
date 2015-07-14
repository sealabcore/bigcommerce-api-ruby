# Time
# Timestamp ping to check the system status.
# https://developer.bigcommerce.com/api/stores/v2/time

module Bigcommerce
  class System < Resource
    use_endpoint 'time'

    property :time

    def time
      all
    end
  end
end

# Webhook
# Register and manage webhooks that connect events from a store to
# external URLs.
# https://developer.bigcommerce.com/api/stores/v2/webhooks

module Bigcommerce
  class Webhook < Resource
    use_endpoint 'hooks'

    property :id
    property :client_id
    property :store_hash
    property :scope
    property :destination
    property :headers
    property :is_active
    property :created_at
    property :update_at
  end
end

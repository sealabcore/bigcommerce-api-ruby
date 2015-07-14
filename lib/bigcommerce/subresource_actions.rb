module Bigcommerce
  module SubresourceActions
    def all(parent_id, params = {})
      fail ArgumentError if parent_id.nil?
      self.class.build_response_object(http_transport.get build_path(parent_id), params)
    end

    def find(parent_id, resource_id)
      fail ArgumentError if [parent_id, resource_id].any?(&:nil?)
      self.class.build_response_object(http_transport.get build_path([parent_id, resource_id]))
    end

    def create(parent_id, params)
      fail ArgumentError if parent_id.nil?
      self.class.build_response_object(http_transport.post build_path(parent_id), params)
    end

    def update(parent_id, resource_id, params)
      fail ArgumentError if [parent_id, resource_id].any?(&:nil?)
      self.class.build_response_object(http_transport.put build_path([parent_id, resource_id]), params)
    end

    def destroy(parent_id, resource_id)
      fail ArgumentError if [parent_id, resource_id].any?(&:nil?)
      self.class.build_response_object(http_transport.delete build_path([parent_id, resource_id]))
    end

    def destroy_all(parent_id)
      fail ArgumentError if parent_id.nil?
      self.class.build_response_object(http_transport.delete build_path(parent_id))
    end

    def build_path(keys = [])
      keys = [] if keys.nil?
      keys = [keys] if keys.is_a? Numeric
      ids = self.class.endpoint.scan('%d').count + self.class.endpoint.scan('%s').count
      str = ids > keys.size ? self.class.endpoint.chomp('%d').chomp('%s').chomp('/') : self.class.endpoint
      (str % keys).chomp('/')
    end
  end
end

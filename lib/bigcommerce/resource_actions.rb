module Bigcommerce
  module ResourceActions
    def all(params = {})
      self.class.build_response_object(http_transport.get self.class.endpoint, params)
    end

    def find(resource_id)
      fail ArgumentError if resource_id.nil?
      self.class.build_response_object(http_transport.get "#{self.class.endpoint}/#{resource_id}")
    end

    def create(params)
      self.class.build_response_object(http_transport.post self.class.endpoint, params)
    end

    def update(resource_id, params)
      fail ArgumentError if resource_id.nil?
      self.class.build_response_object(http_transport.put "#{self.class.endpoint}/#{resource_id}", params)
    end

    def destroy(resource_id)
      fail ArgumentError if resource_id.nil?
      self.class.build_response_object(http_transport.delete "#{self.class.endpoint}/#{resource_id}")
    end

    def destroy_all
      self.class.build_response_object(http_transport.delete self.class.endpoint)
      delete path.build
    end
  end
end

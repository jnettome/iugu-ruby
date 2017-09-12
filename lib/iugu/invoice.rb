module Iugu
  class Invoice < APIResource
    include Iugu::APIFetch
    include Iugu::APICreate
    include Iugu::APISave
    include Iugu::APIDelete

    def customer
      return false unless @attributes['customer_id']
      Customer.fetch @attributes['customer_id']
    end

    def cancel
      copy Iugu::Factory.create_from_response(self.class.object_type, APIRequest.request('PUT', "#{self.class.url(id)}/cancel"))
      self.errors = nil
      true
    rescue Iugu::RequestWithErrors => ex
      self.errors = ex.errors
      false
    end

    def delete
      copy Iugu::Factory.create_from_response(self.class.object_type, APIRequest.request('DELETE', "#{self.class.url(id)}"))
      self.errors = nil
      true
    rescue Iugu::RequestWithErrors => ex
      self.errors = ex.errors
      false
    end

    def refund
      copy Iugu::Factory.create_from_response(self.class.object_type, APIRequest.request('POST', "#{self.class.url(id)}/refund"))
      self.errors = nil
      true
    rescue Iugu::RequestWithErrors => ex
      self.errors = ex.errors
      false
    end
  end
end

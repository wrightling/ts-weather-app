module ApiException
  class BaseError < StandardError
    attr_accessor :code, :response
  end
  
  class BadRequest < BaseError
  end

  class ApiError < BaseError
    def initialize(code:, response:)
      @code = code
      @response = response
      super
    end
  end
end
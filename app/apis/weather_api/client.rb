module WeatherApi
  module Client
    HTTP_OK_CODE = 200

    def self.configure
      yield(configuration) if block_given?
    end

    def self.configuration
      Configuration.instance
    end

    def self.weather_info(city: "", state: "", zip_code: "")
      raise ApiException::BadRequest if city.empty? && state.empty? && zip_code.empty?
      
      cached = cached_weather_info(zip_code)

      weather_info = fetch_weather_data(cached, city, state, zip_code)

      { cache_hit: !cached.nil?, weather: weather_info }
    end

    private

    def self.cached_weather_info(zip_code)
      return nil if zip_code.empty?
      
      Rails.cache.fetch(zip_code)
    end

    def self.fetch_weather_data(cached, city, state, zip_code)
      return cached if !cached.nil?

      address = form_address(city, state, zip_code)
      response = request_timeline(address)
      Rails.cache.write(zip_code, response, expires_in: 30.minutes) if !zip_code.empty?

      response
    end

    def self.form_address(city, state, zip_code)
      [city, state, zip_code].keep_if { |value| !value.empty? }.join(",")
    end

    def self.connection
      Faraday.new(
        url: configuration.base_uri,
        headers: {'Content-Type' => 'application/json'}
      )
    end
    
    def self.request_timeline(address)
      response = connection.get("/VisualCrossingWebServices/rest/services/timeline/#{address}", { key: configuration.api_key })

      return parsed_response(response) if response_successful?(response)

      raise ApiException::ApiError.new(code: response.status, response: response.body)
    end

    def self.response_successful?(response)
      response.status == HTTP_OK_CODE
    end

    def self.parsed_response(response)
      JSON.parse(response.body)
    end
  end
end
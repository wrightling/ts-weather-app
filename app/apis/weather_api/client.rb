module WeatherApi
  module Client
    def self.configure
      yield(configuration) if block_given?
    end

    def self.configuration
      Configuration.instance
    end

    def self.weather_info
      url = configuration.base_uri
      # TODO
    end
  end
end
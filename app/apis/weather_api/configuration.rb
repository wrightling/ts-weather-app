require 'singleton'

module WeatherApi
  class Configuration
    include Singleton

    attr_accessor :base_uri, :api_key
  end
end
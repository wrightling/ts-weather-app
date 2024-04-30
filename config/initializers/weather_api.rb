 Rails.application.config.to_prepare do
   WeatherApi::Client.configure do |config|
     config.base_uri = 'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services'
     config.api_key = ENV.fetch('WEATHER_API_KEY')
   end
 end
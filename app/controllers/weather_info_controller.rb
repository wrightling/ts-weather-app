class WeatherInfoController < ApplicationController
  def index
  end

  def show
    puts "show params: #{weather_params}"
  end

  private

  def weather_params
    params.permit(:city, :state, :commit)
  end
end

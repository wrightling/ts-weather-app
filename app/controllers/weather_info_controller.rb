class WeatherInfoController < ApplicationController
  def index
  end

  def show
    @weather_data = WeatherApi::Client.weather_info(
      city: weather_params[:city],
      state: weather_params[:state],
      zip_code: weather_params[:zip_code]
    )
  end

  private

  def weather_params
    params.permit(:city, :state, :zip_code, :commit)
  end
end

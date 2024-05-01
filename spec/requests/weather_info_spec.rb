require 'rails_helper'

RSpec.describe "WeatherInfos", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/weather_info/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/weather_info/show"
      expect(response).to have_http_status(:success)
    end
  end

end

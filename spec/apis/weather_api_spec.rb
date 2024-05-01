require 'rails_helper'

RSpec.describe "WeatherApi" do
  describe "GET /timeline" do
    let (:zip_code) { "80116" }
    let (:city) { "Franktown" }
    let (:state) { "CO" }

    context "with zip code" do
      it "returns weather info with all address info" do
        expect(WeatherApi::Client.weather_info(city: city, state: state, zip_code: zip_code)[:weather])
          .not_to be_nil
      end

      it "returns weather info with zip only" do
        expect(WeatherApi::Client.weather_info(zip_code: zip_code)[:weather])
          .not_to be_nil
      end
    end

    context "without zip code" do
      it "returns weather info with city and state only" do
        expect(WeatherApi::Client.weather_info(city: city, state: state)[:weather])
          .not_to be_nil
      end
    end

    context "missing all address info" do
      it "raises a BadRequest error" do
        expect { WeatherApi::Client.weather_info() }.to raise_error(ApiException::BadRequest)
      end
    end

    describe "caches by zip code" do
      let(:memory_store) { ActiveSupport::Cache.lookup_store(:memory_store) }
      let(:cache) { Rails.cache }
      
      before do
        allow(Rails).to receive(:cache).and_return(memory_store)
        Rails.cache.clear
      end

      context "on a cache miss" do
        it "cache hit indicator is false" do
          expect(WeatherApi::Client.weather_info(zip_code: zip_code)[:cache_hit]).to be_falsey
        end
      end

      context "on a cache hit" do
        def weather_call
          WeatherApi::Client.weather_info(zip_code: zip_code)
        end

        it "cache hit indicator is true" do
          weather_call
          expect(weather_call[:cache_hit]).to be_truthy
        end
      end
    end
  end
end
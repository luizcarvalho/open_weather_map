# frozen_string_literal: true

RSpec.describe OpenWeatherMap::Forecast do
  let(:weather_item_1) do
    { dt: 1_644_332_400,
      main: { temp: 29.75 },
      weather: [{ main: 'Rain', description: 'light rain' }],
      dt_txt: '2022-02-08 15:00:00' }
  end

  let(:weather_item_2) do
    { dt: 1_644_332_000,
      main: { temp: 25.00 },
      weather: [{ main: 'Rain', description: 'light rain' }],
      dt_txt: '2022-02-08 00:00:00' }
  end

  let(:forecast_atributes) do
    {
      list: [weather_item_1]
    }
  end
  let(:forecast_valid) { OpenWeatherMap::Forecast.new(forecast_atributes) }

  describe '.initialize' do
    it 'with valid attributes' do
      expect(forecast_valid.list).to all(be_a(Hash))
      expect(forecast_valid.weathers).to all(be_a(OpenWeatherMap::Weather))
    end

    it 'with invalid  attributes' do
      forecast = OpenWeatherMap::Forecast.new

      expect(forecast.list).to be_nil
    end
  end
end

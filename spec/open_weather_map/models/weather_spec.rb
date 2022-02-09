# frozen_string_literal: true

RSpec.describe OpenWeatherMap::Weather do
  let(:weather_atributes) do
    {
      coord: { lon: -48.3336, lat: -10.1838 },
      weather: [{ main: 'Clouds', description: 'few clouds' }],
      main: { temp: 26.75 },
      dt: 1_644_320_592,
      name: 'Palmas',
      dt_txt: '2022-02-08 00:00:00'
    }
  end
  let(:weather_valid) { OpenWeatherMap::Weather.new(weather_atributes) }

  describe '.initialize' do
    it 'with valid attributes' do
      expect(weather_valid.dt).to be_a(Integer)
      expect(weather_valid.location_coordinates).to be_a(Hash)
      expect(weather_valid.main).to be_a(Hash)
      expect(weather_valid.weather).to be_a(Array)
      expect(weather_valid.location_name).to be_a(String)
      expect(weather_valid.dt_txt).to be_a(String)
    end

    it 'with invalid  attributes' do
      weather = OpenWeatherMap::Weather.new(nil)

      expect(weather.main).to be_nil
    end
  end

  describe '.weather_main' do
    it 'with valid attributes' do
      expect(weather_valid.weather_main).to eq('Clouds')
    end

    it 'with invalid attributes' do
      weather = OpenWeatherMap::Weather.new(nil)

      expect(weather.weather_main).to be_nil
    end
  end

  describe '.temperature' do
    it 'with valid attributes' do
      expect(weather_valid.temperature).to eq(26.75)
    end

    it 'with invalid attributes' do
      weather = OpenWeatherMap::Weather.new(nil)

      expect(weather.temperature).to be_nil
    end
  end

  describe '.weather_description' do
    it 'with valid attributes' do
      expect(weather_valid.weather_description).to eq('few clouds')
    end

    it 'with invalid attributes' do
      weather = OpenWeatherMap::Weather.new(nil)

      expect(weather.weather_description).to be_nil
    end
  end

  describe '.date' do
    it 'with valid attributes' do
      expect(weather_valid.date).to eq(Time.new(2022,2,8))
    end

    it 'with invalid attributes' do
      weather = OpenWeatherMap::Weather.new(nil)

      expect(weather.date).to be_nil
    end
  end

end

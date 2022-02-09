# frozen_string_literal: true

RSpec.describe OpenWeatherMap::Configuration do
  let(:configuration) { OpenWeatherMap::Configuration.new }

  context "defaults" do
    it "load default configuration" do
      expect(OpenWeatherMap::Configuration.default).to be_an(OpenWeatherMap::Configuration)
    end
  end

  context "configurable" do
    it 'using  a block' do
      configuration.configure do |config|
        config.lang = 'pt_br'
      end

      expect(configuration.lang).to eq('pt_br')
    end

    it 'directly from main class OpenWeatherMap' do
      OpenWeatherMap.configure do |config|
        config.lang = 'pt_br'
      end

      default_config = OpenWeatherMap::Configuration.default
      expect(default_config.lang).to eq('pt_br')
    end

    it 'using ENV variables' do
      ENV['OPEN_WEATHER_MAP_LANG'] = 'pt_br'

      default_config = OpenWeatherMap::Configuration.default
      expect(default_config.lang).to eq('pt_br')
    end
  end
end

RSpec.describe OpenWeatherMap::ApiClient do
  let(:api_client) { OpenWeatherMap::ApiClient.new }
  let(:config) { OpenWeatherMap::Configuration.default }
  describe 'initialization' do
    it 'configuration' do
      expect(api_client.config).not_to be_nil
    end
  end

  describe '.call_api' do
    let(:coordinates) { { lat: '-10.1837852', lon: '-48.3336423' } }
    let(:weather_response) { api_client.call_api('data/weather', query_params: coordinates) }
    let(:forecast_response) { api_client.call_api('data/forecast', query_params: coordinates) }

    it 'weather status code 200' do
      expect(weather_response[:cod]).to eq(200)
    end

    it 'forecast status code 200' do
      expect(forecast_response[:cod]).to eq('200')
    end

    it 'have all valid keys' do
      response = api_client.call_api('data/weather', query_params: coordinates)

      expect(response.keys).to include(:weather, :main, :name)
    end


  end

  describe '.build_query_params' do
    it 'when remove_params if value is nil' do
      params = { a: 1, b: nil }
      builded_params = api_client.build_query_params(params)

      expect(builded_params.keys).not_to include(:b)
    end

    it 'when method params is nil return  Hash' do
      params = nil
      builded_params = api_client.build_query_params(params)

      expect(builded_params).to be_a(Hash)
    end

    it 'include app_id, unitis and lang by default' do
      builded_params = api_client.build_query_params

      expect(builded_params.keys).to include(:appid, :units, :lang)
    end

  end

  describe '.build_url' do
    context 'when path is valid' do
      it 'version is added' do
        path = 'data/weather'
        url = api_client.build_url(path)

        expect(url).to include("/data/#{config.api_version}/weather")
      end

      it 'base_url is appended' do
        path = 'data/weather'
        url = api_client.build_url(path)

        expect(url).to start_with(config.base_url)
      end
    end

    context 'when path is invalid' do
      it 'path contains just one argument' do
        path = 'data'

        expect { api_client.build_url(path) }.to raise_error(ArgumentError)
      end

      it 'path is empty' do
        path = nil

        expect { api_client.build_url(path) }.to raise_error(ArgumentError)
      end
    end

  end

  describe '.parse_response' do
    context 'when body is blank' do
      it {  expect(api_client.parse_response(nil)).to be_nil }
      it {  expect(api_client.parse_response(nil)).to be_nil }
    end
  end

  describe '.build_request' do
    context 'when params' do
      it 'request params exist' do
        params = { lon: '123' }

        request = api_client.build_request('base/weather', query_params: params)

        expect(request.options[:params][:lon]).to eq('123')
      end
    end
  end
end

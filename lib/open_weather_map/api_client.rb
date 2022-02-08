module OpenWeatherMap
  class ApiClient
    # The Configuration instance with setting used in the API client.
    attr_accessor :config


    def initialize
      @config = Configuration.default
    end

    # Fetch OpenWetcherMap API
    #
    #    api_client = OpenWeatherMap::ApiClient.new
    #    coordinates = { lat: '-10.1837852', lon: '-48.3336423' }
    #    api_client.call_api('data/weather', query_params: coordinates)
    #
    # @param [String] path in format 'namespace/path'
    # @param [Hash] options  to request
    # @option options [String] :lat latitude
    # @option options [String] :lon longitude
    #
    # @see https://openweathermap.org/current for more options
    #
    # @return [Hash]
    def call_api(path, options = {})
      request = build_request(path, options)

      response = request.run

      raise StandardError.new(response.body) unless  response.success?

      parse_response(response.body)
    end


    def parse_response(body)
      return if body.nil? || body.empty?

      JSON.parse(body, symbolize_names: true)
    end

    def build_request(path, options = {})
      url = build_url(path)
      query_params = build_query_params(options[:query_params])

      request_options = {
        params: query_params
      }

      Typhoeus::Request.new(url, request_options)
    end

    def build_query_params(params =  {})
      params = (params || {}).delete_if { |_k, v| v.nil? }

      params.merge(appid: @config.appid, lang: @config.lang, units: @config.units)
    end

    # split the url to join API_VERSION and add BASE_URL as prefix of path
    def build_url(path)
      namespace, path = path&.split('/')
      raise ArgumentError.new('path need be follow this format namespace/path') unless namespace && path

      path = "/#{namespace}/#{@config.api_version}/#{path}"
      @config.base_url + path
    end


  end
end
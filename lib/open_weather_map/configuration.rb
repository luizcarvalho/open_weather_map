module OpenWeatherMap
  class Configuration
    # This is a key to access Open Weather Map API
    # You can found it in https://home.openweathermap.org/api_keys
    #
    # You can set this parameter using env var OPEN_WEATHER_MAP_APP_ID
    # This value is required
    attr_accessor :appid

    # You can use this parameter to get the output in your language.
    # Translation is applied for the `city name` and `description`` fields.
    # API support following languages https://openweathermap.org/current#multi
    #
    # You can set this parameter using env var OPEN_WEATHER_MAP_LANG
    # Default value is `en`
    attr_accessor :lang

    # Units of measurement. `standard`, `metric` and `imperial`` units are available.
    #
    # You can set this parameter using env var OPEN_WEATHER_MAP_UNITS
    # Default value is `metric`
    attr_accessor :units

    # Is URL to OpenWeatherMap API
    #
    # You can set this parameter using env var OPEN_WEATHER_MAP_BASE_URL
    # Default value is `https://api.openweathermap.org`
    attr_accessor :base_url

    # Version of Open Weather Map
    # Change this value can cause errors in this Client, currently only version 2.5 has been tested
    #
    # You can set this parameter using env var OPEN_WEATHER_MAP_API_VERSION
    # Default value is `2.5`
    attr_accessor :api_version

    def initialize
      @lang = ENV['OPEN_WEATHER_MAP_LANG'] || 'en'
      @base_url = ENV['OPEN_WEATHER_MAP_BASE_URL'] || 'https://api.openweathermap.org'
      @api_version = ENV['OPEN_WEATHER_MAP_API_VERSION'] || '2.5'
      @appid = ENV['OPEN_WEATHER_MAP_APP_ID']
      @units = ENV['OPEN_WEATHER_MAP_UNITS'] || 'metric'
    end

    # The default Configuration object.
    def self.default
      @default ||= Configuration.new
    end

    # The used for configuration block interface
    def configure
      yield(self) if block_given?
    end
  end
end

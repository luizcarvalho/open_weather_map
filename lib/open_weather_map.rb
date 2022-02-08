# frozen_string_literal: true

require_relative "open_weather_map/configuration"
require_relative "open_weather_map/version"

module OpenWeatherMap
  class Error < StandardError; end


    class << self
      # Customize default settings for the SDK using block.
      #   OpenWeatherMap.configure do |config|
      #     config.appid = "xxx"
      #     config.language = "xxx"
      #   end
      # If no block given, return the default Configuration object.
      def configure
        if block_given?
          yield(Configuration.default)
        else
          Configuration.default
        end
      end
    end
end

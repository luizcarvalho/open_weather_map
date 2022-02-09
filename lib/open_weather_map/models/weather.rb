# frozen_string_literal: true

module OpenWeatherMap
  class Weather
    attr_accessor :main, :weather, :location_name, :location_coordinates, :dt, :dt_txt

    def weather_main
      weather_first&.dig(:main)
    end

    def weather_description
      weather_first&.dig(:description)
    end

    def temperature
      main&.dig(:temp)
    end

    alias_method :temp, :temperature

    def date
      return unless dt_txt

      Time.parse(dt_txt)
    end

    def initialize(attributes = {})
      return if !attributes.is_a?(Hash) || attributes.nil?

      self.main = attributes[:main]
      self.weather = attributes[:weather]
      self.location_name = attributes[:name]
      self.location_coordinates = attributes[:coord]
      self.dt = attributes[:dt]
      self.dt_txt = attributes[:dt_txt]
    end

    private

    def weather_first
      @weather_first ||= weather&.first
    end

  end
end


# {:coord=>{:lon=>-48.3336, :lat=>-10.1838},
#  :weather=>[{:id=>801, :main=>"Clouds", :description=>"few clouds", :icon=>"02d"}],
#  :base=>"stations",
#  :main=>{:temp=>26.75, :feels_like=>29.44, :temp_min=>26.75, :temp_max=>26.75, :pressure=>1012, :humidity=>83},
#  :visibility=>10000,
#  :wind=>{:speed=>0, :deg=>0},
#  :clouds=>{:all=>20},
#  :dt=>1644320592,
#  :sys=>{:type=>1, :id=>8419, :country=>"BR", :sunrise=>1644311583, :sunset=>1644356524},
#  :timezone=>-10800,
#  :id=>3468928,
#  :name=>"Brejo Sêco",
#  :cod=>200}

# frozen_string_literal: true

module OpenWeatherMap
  class Forecast
    attr_accessor :list, :weathers

    def initialize(attributes = {})
      return if !attributes.is_a?(Hash) || attributes.nil?

      self.list = attributes[:list]
      self.weathers = deserialize_weather_list(list)
    end

    def deserialize_weather_list(list)
      return [] unless list

      list.map do |weather|
        Weather.new(weather)
      end
    end

    private

    def weather_first
      @weather_first ||= weather&.first
    end

  end
end


# {:cod=>"200",
#   :message=>0,
#   :cnt=>40,
#   :list=>
#    [{:dt=>1644332400,
#      :main=>
#       {:temp=>29.75,
#        :feels_like=>35.38,
#        :temp_min=>29.75,
#        :temp_max=>29.87,
#        :pressure=>1012,
#        :sea_level=>1012,
#        :grnd_level=>981,
#        :humidity=>74,
#        :temp_kf=>-0.12},
#      :weather=>[{:id=>500, :main=>"Rain", :description=>"light rain", :icon=>"10d"}],
#      :clouds=>{:all=>40},
#      :wind=>{:speed=>0.83, :deg=>331, :gust=>1.89},
#      :visibility=>10000,
#      :pop=>0.87,
#      :rain=>{:"3h"=>1.33},
#      :sys=>{:pod=>"d"},
#      :dt_txt=>"2022-02-08 15:00:00"
#     }
#   ]
# }

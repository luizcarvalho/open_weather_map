# OpenWeatherMap

A Ruby interface to the [Open Weather Map API](https://openweathermap.org/api).

[![Maintainability](https://api.codeclimate.com/v1/badges/6464e896da089aca5ade/maintainability)](https://codeclimate.com/github/luizcarvalho/open_weather_map/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/6464e896da089aca5ade/test_coverage)](https://codeclimate.com/github/luizcarvalho/open_weather_map/test_coverage)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'open_weather_map', gituhub: 'luizcarvalho/open_weather_map'
```

And then execute:

```sh
> bundle install
```

Or install it yourself as:

```sh
> gem install open_weather_map
```

## Quick start

### Configuration

You need set `appid`variable (you can found it [here](https://home.openweathermap.org/api_keys)). You can simple set environment variable `OPEN_WEATHER_MAP_APP_ID` or use configuration module. With it, you change others configurations too.

```ruby
OpenWeatherMap.configure do |config|
    config.lang = 'en' # or variable OPEN_WEATHER_MAP_LANG
    config.base_url = 'https://api.openweathermap.org' # or variable OPEN_WEATHER_MAP_LANG
    config.api_version = '2.5' # or variable OPEN_WEATHER_MAP_API_VERSION
    config.appid = # OPEN_WEATHER_MAP_APP_ID
    config.units = 'metric' # or variable OPEN_WEATHER_MAP_UNITS
end
```

### Usage

You can use this client to get current weather data and daily forecast up to 16 days.

To get current weather data

```ruby
# https://openweathermap.org/current
api_client.call_api('data/weather', query_params: { lat: '-10.1837852', lon: '-48.3336423' })
```

To get forecast weather data from 5 days, for example

```ruby
# https://openweathermap.org/forecast5
api_client.call_api('data/forecast', query_params: { lat: '-10.1837852', lon: '-48.3336423' })
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/luizcarvalho/open_weather_map.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

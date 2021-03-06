# frozen_string_literal: true

require_relative "lib/open_weather_map/version"

Gem::Specification.new do |spec|
  spec.name          = "open_weather_map"
  spec.version       = OpenWeatherMap::VERSION
  spec.authors       = ["Luiz Carvalho"]
  spec.email         = ["contato@luizcarvalho.com"]

  spec.summary       = "Ruby client to fetch weather information from https://openweathermap.org/"
  spec.description   = "Get information about current weather and median from the next 5 days"
  spec.homepage      = "https://github.com/luizcarvalho/open_weather_map"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "typhoeus", "~> 1.4"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end

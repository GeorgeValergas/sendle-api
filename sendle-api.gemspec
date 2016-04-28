# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sendle/api/version'

Gem::Specification.new do |spec|
  spec.name          = "sendle-api"
  spec.version       = Sendle::Api::VERSION
  spec.authors       = ["Bobby Lei"]
  spec.email         = ["bobl53@gmail.com"]
  spec.summary       = "Ruby bindings for the Sendle API"
  spec.description   = "Sendle allows businesses to send parcels door to door for low flat-rates Australia wide. See https://www.sendle.com for details."
  spec.homepage      = "http://api-doc.sendle.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "require_all"

  spec.add_dependency('rest-client')
end

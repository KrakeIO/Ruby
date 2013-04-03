$:.unshift File.join(File.dirname(__FILE__), '/lib')

require 'krake'

Gem::Specification.new do |gem|
  gem.authors       = ["Vikram Verma"]
  gem.email         = ["me@vikramverma.com"]
  gem.description   = "A library to talk to the Krake API"
  gem.summary       = "Access Krake's API"
  gem.homepage      = "https://github.com/KrakeIO/Ruby/"

  gem.files         = `git ls-files`.split($\)
  gem.name          = "krake"
  gem.require_paths = ["lib"]
  gem.version       = "0.0.1"

  gem.add_dependency "rest-client"
end

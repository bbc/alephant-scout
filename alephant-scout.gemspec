# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'alephant/scout/version'

Gem::Specification.new do |spec|
  spec.name          = "alephant-scout"
  spec.version       = Alephant::Scout::VERSION
  spec.authors       = ["C. Oliver Godby"]
  spec.email         = ["oliver.godby02@bbc.co.uk"]
  spec.description   = %q{"Scout URLs to see if they are valid"}
  spec.summary       = %q{"Scout URLs to see if they are valid"}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 3.1"
  spec.add_development_dependency "rspec-nc"
  spec.add_development_dependency "rake-rspec"

  spec.add_runtime_dependency "httparty", "~> 0.13.1"
  spec.add_runtime_dependency "alephant-logger"
  spec.add_runtime_dependency "alephant-support"
end

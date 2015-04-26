# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cacheit/version'

Gem::Specification.new do |spec|
  spec.name          = "cacheit"
  spec.version       = Cacheit::VERSION
  spec.authors       = ["Vivan Kumar"]
  spec.email         = ["vivangkumar@gmail.com"]
  spec.summary       = %q{Cache algorithm implementations in Ruby}
  spec.homepage      = "https://github.com/vivangkumar/cacheit"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~>3.1", ">= 3.2.0"
end

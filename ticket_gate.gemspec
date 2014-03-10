# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ticket_gate/version'

Gem::Specification.new do |spec|
  spec.name          = "ticket_gate"
  spec.version       = TicketGate::VERSION
  spec.authors       = ["Dennis Charles Hackethal", "Stagelink GmbH"]
  spec.email         = ["dennis.hackethal@gmail.com"]
  spec.description   = %q{Ruby client for Stagelink's ticketing API.}
  spec.summary       = %q{TicketGate lets you connect to Stagelink's ticketing API and instantly create events and sell tickets.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rocket_pants"
  
  spec.add_runtime_dependency "rocket_pants", "~> 1.9.1"
end

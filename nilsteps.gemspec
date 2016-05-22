# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nilsteps/version'

Gem::Specification.new do |spec|
  spec.name          = "nilsteps"
  spec.version       = Nilsteps::VERSION
  spec.authors       = ["Hirofumi Wakasugi"]
  spec.email         = ["baenej@gmail.com"]
  spec.summary       = %q{Simple OSC step sequencer}
  spec.description   = %q{NilSteps is an OSC client sequecer for 16 steps / bar, only single track is available for the moment. You need OSC server compatible instruments to hear generated sound.}
  spec.homepage      = "https://github.com/5t111111/nilsteps"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_runtime_dependency 'osc-ruby', '~> 1.1', '>= 1.1.1'
  spec.add_runtime_dependency "bpm_to_msec", "~> 0.0.1"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end

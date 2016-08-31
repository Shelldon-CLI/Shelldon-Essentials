# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shelldon-essentials/version'

Gem::Specification.new do |spec|
  spec.name          = "shelldon-essentials"
  spec.version       = ShelldonEssentials::VERSION
  spec.authors       = ["Wesley Boynton"]
  spec.email         = ["wes@boynton.io"]

  spec.summary       = %q{A small assortment of commands and params to kick-start a basic Shelldon app.}
  spec.homepage      = "http://www.shelldon.io"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = Dir["lib/**/*"]
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "shelldon", "~> 0.0.7"
  spec.add_runtime_dependency "tty"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rake", "~> 10.0"
end

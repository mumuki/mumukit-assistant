
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mumukit/assistant/version'

Gem::Specification.new do |spec|
  spec.name          = 'mumukit-assistant'
  spec.version       = Mumukit::Assistant::VERSION
  spec.authors       = ['Julián Berbel Alt', 'Franco Bulgarelli']
  spec.email         = ['julian@mumuki.org', 'franco@mumuki.org']
  spec.summary       = 'Library for providing assistance with mumuki exercises'
  spec.homepage      = 'http://github.com/mumuki/mumukit-assistant'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/**']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'i18n', '~> 1.0'

  spec.add_dependency 'mumukit-core', '~> 1.20'

  spec.required_ruby_version = '>= 3.0'
end

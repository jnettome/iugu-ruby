# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iugu/version'

Gem::Specification.new do |spec|
  spec.name          = 'iugu'
  spec.version       = Iugu::VERSION
  spec.authors       = ['Marcelo Paez Sequeira']
  spec.email         = ['marcelo@iugu.com']
  spec.summary       = 'Ruby bindings for Iugu API'
  spec.description   = 'Iugu is a brazilian payment gateway. See https://iugu.com for details.'
  spec.homepage      = 'https://iugu.com/'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rest-client', '~> 2.0.2'

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest'
end

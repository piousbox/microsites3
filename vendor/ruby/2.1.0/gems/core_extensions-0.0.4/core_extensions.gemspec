# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'core_extensions/version'

Gem::Specification.new do |gem|
  gem.name          = 'core_extensions'
  gem.version       = CoreExtensions::VERSION
  gem.authors       = ['Sarkis Karayan']
  gem.email         = ['skarayan@gmail.com']
  gem.description   = 'Ruby Core Object Extensions'
  gem.summary       = 'Ruby Core Object Extensions'
  gem.homepage      = 'https://github.com/skarayan/core_extensions'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'activesupport'
end

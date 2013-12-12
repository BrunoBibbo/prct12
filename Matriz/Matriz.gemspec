# -*- coding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'Matriz/version'

Gem::Specification.new do |spec|
  spec.name          = "Matriz"
  spec.version       = Matriz::VERSION
  spec.authors       = ["Bruno Bibbo & Ayoze Elvira"]
  spec.email         = ["alu0100697063@ull.edu.es"]
  spec.description   = %q{Esta gema se utilizara para crear matrices, tanto de forma densa como dispersa para la practica de esta semana}
  spec.summary       = %q{Creacion de matrices}
  spec.homepage      = "https://github.com/alu0100697063/prct09.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency 'guard'
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "guard-bundler"
  spec.add_development_dependency 'gemnasium' 
end

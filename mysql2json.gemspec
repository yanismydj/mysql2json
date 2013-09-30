# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mysql2json/version'

Gem::Specification.new do |spec|
  spec.name          = "mysql2json"
  spec.version       = Mysql2json::VERSION
  spec.authors       = ["yan"]
  spec.email         = ["info@yanlhert.com"]
  spec.description   = %q{Simple Gem to export a Mysql database to json}
  spec.summary       = %q{Given db details, it will connect and download all tables and table rows and make a giant hash, it will then convert this hash to json and dump to file}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.6"

  spec.add_dependency "ruby-progressbar"
  spec.add_dependency "mysql2"
end

# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'credit_card_detector/version'

Gem::Specification.new do |gem|
  gem.name          = "credit_card_detector"
  gem.version       = CreditCardDetector::VERSION
  gem.authors       = ["Igor"]
  gem.email         = ["fedoronchuk@gmail.com"]
  gem.description   = %q{A ruby gem for validating credit card numbers}
  gem.summary       = "gem should be used for credit card numbers validation, card brands detections, luhn checks"
  gem.homepage      = "http://fivell.github.io/credit_card_detector/"
  gem.license     = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "activesupport", ">= 3"

  gem.add_development_dependency "mocha", '1.1.0'
  gem.add_development_dependency 'rake', '~> 10'
end

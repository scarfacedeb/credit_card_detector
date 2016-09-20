lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "credit_card_detector/version"

Gem::Specification.new do |gem|
  gem.name          = "credit_card_detector"
  gem.version       = CreditCardDetector::VERSION
  gem.authors       = ["Andrew Volozhanin", "Igor"]
  gem.email         = ["scarfacedeb@gmail.com", "fedoronchuk@gmail.com"]
  gem.description   = %q{A ruby gem for validating credit card numbers}
  gem.summary       = "Gem provides basic credit card number validation and type detection without any extra dependencies"
  gem.homepage      = ""
  gem.license     = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake", "~> 10.5"
  gem.add_development_dependency "minitest", "~> 5.9"
  gem.add_development_dependency "pry"
end

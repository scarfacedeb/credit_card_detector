# require "coveralls"
# Coveralls.wear!

require "minitest/autorun"
require "mocha/mini_test"
require "i18n"
require "credit_card_detector"

I18n.config.enforce_available_locales = true

VALID_NUMBERS = YAML.load_file File.join(File.dirname(__FILE__), "fixtures/valid_cards.yml")
INVALID_NUMBERS = YAML.load_file File.join(File.dirname(__FILE__), "fixtures/invalid_cards.yml")

SKIP_LUHN = [:rupay, :elo, :unionpay]
LUHN_ENABLED = VALID_NUMBERS.reject { |k, _| SKIP_LUHN.include?(k) }
LUHN_DISABLED = VALID_NUMBERS.select { |k, _| SKIP_LUHN.include?(k) }

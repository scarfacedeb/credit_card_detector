require "minitest/autorun"
require "credit_card_detector"

VALID_NUMBERS = YAML.load_file File.join(File.dirname(__FILE__), "fixtures/valid_cards.yml")
INVALID_NUMBERS = YAML.load_file File.join(File.dirname(__FILE__), "fixtures/invalid_cards.yml")

SKIP_LUHN = [:rupay, :elo, :unionpay]
LUHN_ENABLED = VALID_NUMBERS.reject { |k, _| SKIP_LUHN.include?(k) }
LUHN_DISABLED = VALID_NUMBERS.select { |k, _| SKIP_LUHN.include?(k) }

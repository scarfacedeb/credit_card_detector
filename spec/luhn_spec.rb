require "test_helper"
require "credit_card_detector/luhn"

module CreditCardDetector
  describe Luhn do
    describe ".valid?" do
      it "returns true when number is valid" do
        LUHN_ENABLED.each do |brand, card_numbers|
          card_numbers.each do |number|
            assert_equal Luhn.valid?(number.to_s.tr("- ", "")), true
          end
        end
      end

      it "returns false when number is invalid" do
        assert_equal Luhn.valid?("4111111111111110"), false
      end
    end
  end
end

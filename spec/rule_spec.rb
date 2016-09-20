require "test_helper"
require "credit_card_detector/rule"

module CreditCardDetector
  describe Rule do
    describe "#matches?" do
      let(:rule) { Rule.new(length: [8, 9], prefixes: [1234, 2345]) }

      it "matches when number has correct length AND starts from any prefix" do
        rule.matches?(12345678).must_equal true
        rule.matches?(234567890).must_equal true
      end

      it "doesn't match when number has incorrect length" do
        rule.matches?(123).must_equal false
        rule.matches?("").must_equal false
        rule.matches?(1234567890123).must_equal false
      end

      it "doesn't match when number doesn't start from any prefix" do
        rule.matches?(01234567).must_equal false
        rule.matches?(00000000).must_equal false
      end
    end
  end
end

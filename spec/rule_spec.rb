require "test_helper"
require "credit_card_detector/rule"

module CreditCardDetector
  describe Rule do
    describe "#matches?" do
      let(:rule) { Rule.new(length: [8, 9], prefixes: [1234, 2345]) }

      it "matches when number has correct length AND starts from any prefix" do
        assert_equal rule.matches?(12345678), true
        assert_equal rule.matches?(234567890), true
      end

      it "doesn't match when number has incorrect length" do
        assert_equal rule.matches?(123), false
        assert_equal rule.matches?(""), false
        assert_equal rule.matches?(1234567890123), false
      end

      it "doesn't match when number doesn't start from any prefix" do
        assert_equal rule.matches?(01234567), false
        assert_equal rule.matches?(00000000), false
      end
    end
  end
end

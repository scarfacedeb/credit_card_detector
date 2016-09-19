require_relative 'test_helper'

describe CreditCardDetector::Factory do

  it 'should generate random brand' do
    number = CreditCardDetector::Factory.random
    CreditCardDetector::Detector.new(number).valid?.must_equal true
  end

  CreditCardDetector::Detector.brands.keys.sort.each do |key|
    describe "#{key}" do
      it "should generate valid #{key}" do
        number = CreditCardDetector::Factory.random(key)
        CreditCardDetector::Detector.new(number).valid?(key).must_equal true
      end
    end
  end
end

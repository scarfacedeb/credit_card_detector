require "credit_card_detector/data"
require "credit_card_detector/luhn"

module CreditCardDetector
  class Detector
    def initialize(number)
      @number = number.to_s.tr('- ', '')
    end

    def valid?(*brands)
      brands.compact!

      if brands.empty?
        !brand.nil?
      else
        validate_brands(brands)
        brands.include?(brand.id)
      end
    end

    def valid_luhn?
      @valid_luhn ||= Luhn.valid?(@number)
    end

    def brand
      @brand ||= Data.brands.find { |brand| matches_brand? brand }
    end

    def brand_name
      brand.name if brand
    end

    protected

    def matches_brand?(brand)
      return if brand.luhn? && !valid_luhn?
      brand.matches?(@number)
    end

    def validate_brands(brands)
      brands.each do |key|
        next if Data.ids.include?(key)
        fail Error, "brand #{key} is undefined"
      end
    end
  end
end

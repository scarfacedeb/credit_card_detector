require "credit_card_detector/rule"

module CreditCardDetector
  class Brand
    attr_reader :id, :name, :options

    def initialize(id, data)
      @id = id
      @name = data.fetch(:name)
      @raw_rules = data.fetch(:rules)
      @options = data.fetch(:options, {})
    end

    def matches?(number)
      rules.any? { |rule| rule.matches? number }
    end

    def luhn?
      !@options.fetch(:skip_luhn, false)
    end

    def rules
      @rules ||= @raw_rules.map { |rule| Rule.new rule }
    end
  end
end

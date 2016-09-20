module CreditCardDetector
  class Rule
    def initialize(length:, prefixes:)
      @length = length
      @regexp = compile_regexp(prefixes)
    end

    def matches?(number)
      matches_length?(number) && matches_prefix?(number)
    end

    def matches_length?(number)
      @length.include? number.size
    end

    def matches_prefix?(number)
      @regexp.match number
    end

    private

    def compile_regexp(prefixes)
      Regexp.new("^#{prefixes.join("|")}")
    end
  end
end

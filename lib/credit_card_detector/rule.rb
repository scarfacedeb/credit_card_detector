module CreditCardDetector
  class Rule
    def initialize(length:, prefixes:)
      @length = length
      @regexp = compile_regexp(prefixes)
    end

    def matches?(number)
      matches_length?(number.to_s) && matches_prefix?(number.to_s)
    end

    def matches_length?(number)
      @length.include? number.size
    end

    def matches_prefix?(number)
      !!(number =~ @regexp)
    end

    private

    def compile_regexp(prefixes)
      Regexp.new("^(#{prefixes.join("|")})")
    end
  end
end

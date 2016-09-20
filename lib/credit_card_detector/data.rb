require "yaml"
require "credit_card_detector/brand"

module CreditCardDetector
  module Data
    DATA = File.expand_path("../../data/brands.yaml", __FILE__)

    class << self
      def brands
        @data ||= raw_data.map { |key, data| Brand.new key, data }
      end

      def ids
        @ids ||= data.map(&:id)
      end

      def raw_data
        YAML.load_file DATA
      end
    end
  end
end

# frozen_string_literal: true

module QuoteService
  class Quote
    include HTTParty
    attr_reader :text, :author

    def initialize(text:, author:)
      @text   = text
      @author = author
    end
  end
end

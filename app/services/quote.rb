# frozen_string_literal: true

require 'httparty'

module Services
  class Quote
    include HTTParty
    attr_reader :text, :author

    def initialize(text:, author:)
      @text   = text
      @author = author
    end

    def self.fetch
      response = post('https://andruxnet-random-famous-quotes.p.mashape.com/?cat=movies', headers: {
        'X-Mashape-Key' => 'aYs9cdMBhgmsh5H8o0roD6pAT9Jvp1i8Nn5jsnPtYjugfZ74az',
        'Content-Type' => 'application/x-www-form-urlencoded',
        'Accept' => 'application/json'
      })

      text   = JSON.parse(response)['quote']
      author = JSON.parse(response)['author']

      Quote.new(text: text, author: author)
    end
  end
end

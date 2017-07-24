# frozen_string_literal: true

require 'httparty'

module QuoteService
  class QuoteApi
    include HTTParty

    def self.fetch
      response = post('https://andruxnet-random-famous-quotes.p.mashape.com/?cat=movies', headers: {
        'X-Mashape-Key' => 'aYs9cdMBhgmsh5H8o0roD6pAT9Jvp1i8Nn5jsnPtYjugfZ74az',
        'Content-Type' => 'application/x-www-form-urlencoded',
        'Accept' => 'application/json'
      })

      text   = JSON.parse(response.body)['quote']
      author = JSON.parse(response.body)['author']

      Quote.new(text: text, author: author)
    end
  end
end

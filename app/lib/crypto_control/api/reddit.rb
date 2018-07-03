# frozen_string_literal: true

module CryptoControl
  module Api
    module Reddit
      # Get the top or latest news articles for a particular coin
      # @param coin [String] Coin name
      # @param latest [Boolean] True returns latest articles. False returns top articles.
      # @return [Hash]
      def reddit_by_coin(coin, latest: false)
        resp = self.class.get("/reddit/coin/#{coin}", options.merge(query: { latest: latest }))
        parse_response(resp.body)
      end

      # Get the latest news articles for a particular coin
      # @param coin [String] Coin name
      # @return [Hash]
      def reddit_latest_by_coin(coin)
        reddit_by_coin(coin, latest: true)
      end

      # Get the trending news articles for a particular coin
      # @param coin [String] Coin name
      # @return [Hash]
      def reddit_trending_by_coin(coin)
        reddit_by_coin(coin, latest: false)
      end
    end
  end
end

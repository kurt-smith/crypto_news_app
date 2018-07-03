# frozen_string_literal: true

module CryptoControl
  module Api
    module News
      # Get the top news articles. Top articles are sorted by hotness.
      # @param latest [Boolean] True returns latest articles. False returns top articles.
      # @return [Hash]
      def news(latest: false)
        resp = self.class.get('/news', options.merge(query: { latest: latest }))
        parse_response(resp.body)
      end

      # Helper for latest news
      # @return [Hash] Latest news available
      def news_latest
        news(latest: true)
      end

      # Helper for trending/popular news
      # @return [Hash] Trending news
      def news_trending
        news(latest: false)
      end

      # Get the top news articles by category.
      #  There are 6 categories; Analysis, Blockchain, Exchanges, Government, Mining & ICOs.
      #  Everything goes into the General category.
      # @return [Hash] News by category
      def news_by_categories
        resp = self.class.get('/news/category', options)
        parse_response(resp.body)
      end

      # Get the top or latest news articles for a particular coin
      # @param coin [String] Coin name
      # @param latest [Boolean] True returns latest articles. False returns top articles.
      # @return [Hash]
      def news_by_coin(coin, latest: false)
        resp = self.class.get("/news/coin/#{coin}", options.merge(query: { latest: latest }))
        parse_response(resp.body)
      end

      # Get the latest news articles for a particular coin
      # @param coin [String] Coin name
      # @return [Hash]
      def news_latest_by_coin(coin)
        news_by_coin(coin, latest: true)
      end

      # Get the trending news articles for a particular coin
      # @param coin [String] Coin name
      # @return [Hash]
      def news_trending_by_coin(coin)
        news_by_coin(coin, latest: false)
      end

      # Get the top news for a coin by category.
      #  There are 6 categories; Analysis, Blockchain, Exchanges, Government, Mining & ICOs.
      #  Everything goes into the General category.
      # @param coin [String] Coin name
      # @return [Hash]
      def news_category_by_coin(coin)
        resp = self.class.get("/news/coin/#{coin}/category", options)
        parse_response(resp.body)
      end
    end
  end
end

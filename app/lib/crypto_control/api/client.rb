# frozen_string_literal: true

# Lib to request and parse data from Crypto Control Api
# @see https://api-docs.cryptocontrol.io/
module CryptoControl
  module Api
    class Client
      include CryptoControl::Api::News
      include CryptoControl::Api::Reddit
      include CryptoControl::Api::Twitter

      include HTTParty

      BASE_URI = 'https://cryptocontrol.io'
      VERSIONED_API_URI = "#{BASE_URI}/api/v1/public"

      base_uri VERSIONED_API_URI

      attr_reader :headers, :options

      def initialize(headers: {}, options: {})
        @headers = default_headers.merge(headers)
        @options = options.merge(headers: @headers)
      end

      protected

      def default_headers
        {
          'X-API-KEY' => App::Config::CRYPTO_CONTROL_API_KEY
        }
      end

      # @param body [String] Response body
      # @return [Hash]
      def parse_response(body)
        JSON.parse(body, symbolize_names: true)
      end
    end
  end
end

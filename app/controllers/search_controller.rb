# frozen_string_literal: true

class SearchController < ApplicationController
  before_action :recent_searches, only: %i[history]

  # Return data from remote form
  # @note JS response only
  def trending_by_coin
    resp = CryptoControlApi.news_trending_by_coin(search_params[:coin_name])

    search = Search.new(
      keyword: search_params[:coin_name], source: App::Search::Sources::NEWS,
      type: App::Search::Types::TOP, request_ip: request.remote_ip, results: resp.is_a?(Array) ? resp : [resp]
    )

    search.save if search.valid?
    @results = search[:results]
    recent_searches
    @search_details = @recent_searches.find { |k, _v| k == search_params[:coin_name] }&.last

    respond_to :js
  end

  # returns queried search history
  # @note JS response only
  def history
    search = @recent_searches.sort_by do |key, arr|
      case search_history_params[:sort_by]
      when 'count' then arr.count
      when 'created_at' then arr.first.created_at # query is ordered by most recently created
      when 'keyword' then key
      end
    end

    @history = order_descending? ? search.reverse : search

    respond_to :js
  end

  private

  def search_history_params
    params.permit(:sort_by, :order_by, :search_type)
  end

  def order_descending?
    search_history_params[:order_by].eql?('desc')
  end
end

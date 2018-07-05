# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def search_params
    {
      coin_name: params[:coin_name].presence&.strip&.downcase
    }.compact
  end

  def recent_searches
    @recent_searches = Search.all.order(created_at: :desc).group_by(&:keyword)
  end
end

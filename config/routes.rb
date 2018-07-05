# frozen_string_literal: true

Rails.application.routes.draw do
  root 'root#home'

  # search features
  get 'search/trending' => 'search#trending_by_coin', as: :search_trending_coin
  get 'search/history' => 'search#history', as: :search_history
end

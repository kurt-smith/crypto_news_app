# frozen_string_literal: true

class RootController < ApplicationController
  before_action :recent_searches, only: %i[home]

  def home
    @search = CryptoControlApi.news_trending
  end
end

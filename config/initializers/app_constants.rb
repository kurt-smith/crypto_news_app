# frozen_string_literal: true

module App
  module Search
    module Types
      ALL = [
        LATEST = 'latest',
        TOP = 'top'
      ].freeze
    end

    module Sources
      ALL = [
        NEWS = 'news',
        REDDIT = 'reddit',
        TWITTER = 'twitter'
      ].freeze
    end
  end
end

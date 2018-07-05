# frozen_string_literal: true

class Search
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia

  store_in collection: 'searches'

  field :keyword, type: String
  field :source, type: String
  field :type, type: String
  field :request_ip, type: String # TODO: Research best data type to use. Most likely not string
  field :results, type: Array # TODO: Test amount of data returned. Useful for historical search results

  validates :keyword, presence:   { message: 'is required' },
                      length:     { minimum: 1, maximum: 255,
                                    message: 'must have more than 1 and less than 255 characters' }

  validates :source, presence: { message: 'is required' },
                     inclusion: { in: App::Search::Sources::ALL }

  validates :type, presence: { message: 'is required' },
                   inclusion: { in: App::Search::Types::ALL }

  validates :request_ip, presence: { message: 'is required' }
  validates :results, presence: { message: 'is required' }
end

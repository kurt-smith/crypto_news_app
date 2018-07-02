# frozen_string_literal: true

class ApplicationRecord
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paranoia
end

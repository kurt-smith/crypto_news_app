# frozen_string_literal: true

FactoryBot.define do
  factory :search do
    keyword { Faker::Hacker.unique.verb }
    source { App::Search::Sources::ALL.sample }
    type { App::Search::Types::ALL.sample }
    request_ip { [Faker::Internet.ip_v4_address, Faker::Internet.ip_v6_address].sample }
    results do
      [
        {
          id: Faker::Crypto.md5
        },
        {
          id: Faker::Crypto.md5
        }
      ]
    end
  end

  factory :search_request, class: Hash do
    keyword { Faker::Hacker.unique.verb }
    source { App::Search::Sources::ALL.sample }
    type { App::Search::Types::ALL.sample }
    request_ip { [Faker::Internet.ip_v4_address, Faker::Internet.ip_v6_address].sample }
    results do
      [
        {
          id: Faker::Crypto.md5
        },
        {
          id: Faker::Crypto.md5
        }
      ]
    end

    initialize_with { attributes }
  end
end

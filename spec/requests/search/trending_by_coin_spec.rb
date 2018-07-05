# frozen_string_literal: true

require 'rails_helper'

describe 'Search Trending by Coin', type: :request do
  let(:search) { FactoryBot.create(:search) }
  let(:json) { fixture('crypto_control/news_latest.json') }

  it 'returns 200' do
    stub_request(:get, /\/news/).and_return(status: 200, body: json)
    get search_trending_coin_path, params: { coin_name: search[:keyword] }, xhr: true

    expect(a_request(:get, /\/news\/coin\/.+\?latest=false/)).to have_been_made.once

    expect(response.content_type).to eq('text/javascript')
    expect(response.success?).to be_truthy
    expect(response.body).not_to be_empty
    expect(response.code).to eq('200')
  end
end

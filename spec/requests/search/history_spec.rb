# frozen_string_literal: true

require 'rails_helper'

describe 'Search History', type: :request do
  let(:search) { FactoryBot.create(:search) }

  it 'returns 200' do
    get search_history_path, xhr: true
    expect(response.content_type).to eq('text/javascript')
    expect(response.success?).to be_truthy
    expect(response.body).not_to be_empty
    expect(response.code).to eq('200')
  end
end

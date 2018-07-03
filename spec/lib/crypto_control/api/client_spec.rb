# frozen_string_literal: true

require 'rails_helper'

describe CryptoControl::Api::Client do
  it { expect(described_class::BASE_URI).to eq('https://cryptocontrol.io') }
  it { expect(described_class::VERSIONED_API_URI).to eq('https://cryptocontrol.io/api/v1/public') }

  context 'News' do
    describe '#news' do
      let(:json) { fixture('crypto_control/news_trending.json') }

      it 'requests /news' do
        stub_request(:get, /\/news/).and_return(status: 200, body: json)
        subject.news
        expect(a_request(:get, /\/news/)).to have_been_made.once
      end
    end

    describe '#news_latest' do
      let(:json) { fixture('crypto_control/news_latest.json') }

      it 'requests /news with latest' do
        stub_request(:get, /\/news/).and_return(status: 200, body: json)
        subject.news_latest
        expect(a_request(:get, /\/news\?latest=true/)).to have_been_made.once
      end
    end

    describe '#news_trending' do
      let(:json) { fixture('crypto_control/news_trending.json') }

      it 'requests /news with latest' do
        stub_request(:get, /\/news/).and_return(status: 200, body: json)
        subject.news_trending
        expect(a_request(:get, /\/news\?latest=false/)).to have_been_made.once
      end
    end

    describe '#news_by_categories' do
      let(:json) { fixture('crypto_control/news_by_categories.json') }

      it 'requests /news with latest' do
        stub_request(:get, /\/news\/category/).and_return(status: 200, body: json)
        subject.news_by_categories
        expect(a_request(:get, /\/news\/category/)).to have_been_made.once
      end
    end

    describe '#news_by_coin' do
      let(:json) { fixture('crypto_control/news_trending_by_coin.json') }

      it 'requests /news/coin/:coin with latest' do
        stub_request(:get, /\/news\/coin/).and_return(status: 200, body: json)
        subject.news_by_coin('bitcoin')
        expect(a_request(:get, /\/news\/coin\/bitcoin/)).to have_been_made.once
      end
    end

    describe '#news_latest_by_coin' do
      let(:json) { fixture('crypto_control/news_trending_by_coin.json') }

      it 'requests /news/coin/:coin with latest' do
        stub_request(:get, /\/news\/coin/).and_return(status: 200, body: json)
        subject.news_latest_by_coin('bitcoin')
        expect(a_request(:get, /\/news\/coin\/bitcoin\?latest=true/)).to have_been_made.once
      end
    end

    describe '#news_trending_by_coin' do
      let(:json) { fixture('crypto_control/news_trending_by_coin.json') }

      it 'requests /news/coin/:coin with latest' do
        stub_request(:get, /\/news\/coin/).and_return(status: 200, body: json)
        subject.news_trending_by_coin('bitcoin')
        expect(a_request(:get, /\/news\/coin\/bitcoin\?latest=false/)).to have_been_made.once
      end
    end

    describe '#news_category_by_coin' do
      let(:json) { fixture('crypto_control/news_trending_by_coin.json') }

      it 'requests /news/coin/:coin with latest' do
        stub_request(:get, /\/news\/coin\/.+\/category/).and_return(status: 200, body: json)
        subject.news_category_by_coin('bitcoin')
        expect(a_request(:get, /\/news\/coin\/bitcoin\/category/)).to have_been_made.once
      end
    end
  end

  context 'Reddit' do
    let(:json) { fixture('crypto_control/reddit_by_coin.json') }

    describe '#reddit_latest_by_coin' do
      it 'requests /reddit/coin/:coin' do
        stub_request(:get, /\/reddit\/coin/).and_return(status: 200, body: json)
        subject.reddit_latest_by_coin('bitcoin')
        expect(a_request(:get, /\/reddit\/coin\/bitcoin\?latest=true/)).to have_been_made.once
      end
    end

    describe '#reddit_trending_by_coin' do
      it 'requests /reddit/coin/:coin' do
        stub_request(:get, /\/reddit\/coin/).and_return(status: 200, body: json)
        subject.reddit_trending_by_coin('bitcoin')
        expect(a_request(:get, /\/reddit\/coin\/bitcoin\?latest=false/)).to have_been_made.once
      end
    end
  end

  context 'Twitter' do
    let(:json) { fixture('crypto_control/twitter_by_coin.json') }

    describe '#twitter_latest_by_coin' do
      it 'requests /reddit/coin/:coin' do
        stub_request(:get, /\/tweets\/coin/).and_return(status: 200, body: json)
        subject.twitter_latest_by_coin('bitcoin')
        expect(a_request(:get, /\/tweets\/coin\/bitcoin\?latest=true/)).to have_been_made.once
      end
    end

    describe '#reddit_trending_by_coin' do
      it 'requests /twitter/coin/:coin' do
        stub_request(:get, /\/tweets\/coin/).and_return(status: 200, body: json)
        subject.twitter_trending_by_coin('bitcoin')
        expect(a_request(:get, /\/tweets\/coin\/bitcoin\?latest=false/)).to have_been_made.once
      end
    end
  end
end

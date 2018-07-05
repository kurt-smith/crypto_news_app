# frozen_string_literal: true

require 'rails_helper'

describe Search do
  it { is_expected.to be_mongoid_document }
  it { is_expected.to be_stored_in(collection: 'searches') }
  it { is_expected.to have_field(:keyword).of_type(String) }
  it { is_expected.to have_field(:source).of_type(String) }
  it { is_expected.to have_field(:type).of_type(String) }
  it { is_expected.to have_field(:request_ip).of_type(String) }
  it { is_expected.to have_field(:results).of_type(Array) }

  it { is_expected.to have_timestamps }
  it { is_expected.to have_field(:deleted_at).of_type(Time).with_default_value_of(nil) }

  context 'validations' do
    describe 'keyword' do
      it { is_expected.to validate_presence_of(:keyword).with_message('is required') }
      it do
        is_expected.to validate_length_of(:keyword)
          .within(1..255)
          .with_message('must have more than 1 and less than 255 characters')
      end
    end

    describe 'source' do
      it { is_expected.to validate_presence_of(:source).with_message('is required') }
      it { is_expected.to validate_inclusion_of(:source).to_allow(App::Search::Sources::ALL) }
    end

    describe 'type' do
      it { is_expected.to validate_presence_of(:type).with_message('is required') }
      it { is_expected.to validate_inclusion_of(:type).to_allow(App::Search::Types::ALL) }
    end

    describe 'request_ip' do
      it { is_expected.to validate_presence_of(:request_ip).with_message('is required') }
    end

    describe 'results' do
      it { is_expected.to validate_presence_of(:results).with_message('is required') }
    end
  end
end

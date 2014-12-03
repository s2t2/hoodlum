require 'rails_helper'

RSpec.describe RubygemsService do
  describe 'api key' do
    it 'is a string provided by https://rubygems.org/profile/edit' do
      expect(RubygemsService::API_KEY).to be_kind_of(String)
    end
  end
end

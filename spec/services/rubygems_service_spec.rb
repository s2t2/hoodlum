require 'rails_helper'
require 'gems'

RSpec.describe RubygemsService do
  describe 'api key' do
    it 'is a string provided by https://rubygems.org/profile/edit' do
      expect(RubygemsService::API_KEY).to be_kind_of(String)
    end
  end

  describe '#owned_gems_and_versions' do
    it 'returns a list of rubygems and rubygem versions' do
      response = RubygemsService.owned_gems_and_versions
      expect(response).to be_kind_of(Array)
      expect(response.first).to be_kind_of(Hash)
      expect(response.first["name"]).to be_kind_of(String)
      expect(response.first["versions"].first["number"]).to be_kind_of(String)
    end
  end
end

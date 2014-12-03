require 'rails_helper'

RSpec.describe RubygemsServiceWorker do
  describe '#perform' do
    it 'persists rubygems' do
      rubygem = Rubygem.where(:name => "mygem").first_or_create!
      rubygem.update_attributes!(
        #:downloads_count => 101,
        #:current_version_number => "1.0.1",
        #:current_version_downloads_count => 76,
        :authors => "me and my friends",
        :info => "this is a full description of the gem",
        :licenses => ["MIT"],
        :project_uri => "github.com/my_repo",
        :gem_uri => "rubygems.org/my_repo",
        :homepage_uri => "github.com/my_repo",
        :wiki_uri => "github.com/my_repo/wiki",
        :documentation_uri => "rubydocs.com/my_repo",
        :mailing_list_uri => nil,
        :source_code_uri => "github.com/my_repo",
        :bug_tracker_uri => "github.com/my_repo/issues"
      )
    end

    it 'persists rubygem download counts' do
      rubygem = Rubygem.where(:name => "mygem").first_or_create!
      RubygemDownloadCount.create!(:rubygem_id => rubygem.id, :total_downloads => 100)
    end

    it 'persists rubygem versions' do
      rubygem = Rubygem.create!({:name => "mygem"})
      rubygem_version = RubygemVersion.where(:rubygem_name => rubygem.name, :number => "1.0.1").first_or_create!
      binding.pry
      rubygem_version.update_attributes(
        :authors => "me and my friends",
        :built_at => Time.now - 12.days,
        :description => "a full description of the gem",
        :summary => "a short description of the gem",
        :prerelease => false
      )
      expect(rubygem.versions).to include(rubygem_version)
    end

    it 'persists rubygem version download counts' do
      rubygem = Rubygem.create!({:name => "mygem"})
      rubygem_version = RubygemVersion.where(:rubygem_id => rubygem.id, :number => "1.0.1").first_or_create!
      expect(rubygem.versions).to include(rubygem_version)
      RubygemVersionDownloadCount.create!(:rubygem_version_id => rubygem_version.id, :total_downloads =>  76)
    end
  end
end
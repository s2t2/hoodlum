require 'gems'

class RubygemsServiceWorker
  def self.perform
    rubygems = Gems.gems
    rubygems.each do |g|
      rubygem = Rubygem.where(:name => g["name"]).first_or_create!
      rubygem.update_attributes!(
        #:downloads_count => rubygem["downloads"].to_i,
        #:current_version_number => rubygem["version"],
        #:current_version_downloads_count => rubygem["version_downloads"].to_i,
        :authors => rubygem["authors"],
        :info => rubygem["info"],
        :licenses => rubygem["licenses"],
        :project_uri => rubygem["project_uri"],
        :gem_uri => rubygem["gem_uri"],
        :homepage_uri => rubygem["homepage_uri"],
        :wiki_uri => rubygem["wiki_uri"],
        :documentation_uri => rubygem["documentation_uri"],
        :mailing_list_uri => rubygem["mailing_list_uri"],
        :source_code_uri => rubygem["source_code_uri"],
        :bug_tracker_uri => rubygem["bug_tracker_uri"]
      )

      #todo: @params [String] :gem_name the gem identifier.
      RubygemDownloadCount.create!(:rubygem_name => rubygem.name, :total_downloads => g["downloads"])

      #todo: @params [String] :gem_name the gem identifier.
      rubygem_versions = Gems.versions(g["name"])
      rubygem_versions.each do |v|
        binding.pry
        rubygem_version = RubygemVersion.where(:rubygem_name => g["name"], :number => v["number"]).first_or_create!
        rubygem_version.update_attributes(
          :authors => v["authors"],
          :built_at => v["built_at"].to_datetime,
          :description => v["description"],
          :summary => v["summary"],
          :prerelease => v["prerelease"]
        )

        #todo: @params [String] :gem_name the gem identifier.
        RubygemVersionDownloadCount.create!(:rubygem_name => rubygem.name, :rubygem_version_number => rubygem_version.number, :total_downloads =>  v["downloads_count"])
      end
    end
  end
end

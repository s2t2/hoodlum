require 'gems'

class RubygemsService
  API_KEY = ENV['HOODLUM_RUBYGEMS_API_KEY']

  # Get a list of author-owned gems and all versions of each.
  #
  # @example
=begin
    [
      {
        "name"=>"gtfs-data_exchange",
        "downloads"=>258,
        "version"=>"0.0.3",
        "version_downloads"=>70,
        "platform"=>"ruby",
        "authors"=>"MJ Rossetti (@s2t2)",
        "info"=>"A ruby wrapper for the gtfs-data-exchange.com api (http://www.gtfs-data-exchange.com/api). List all agencies, or find a specific agency by its data exchange identifier.",
        "licenses"=>["MIT"],
        "project_uri"=>"http://rubygems.org/gems/gtfs-data_exchange",
        "gem_uri"=>"http://rubygems.org/gems/gtfs-data_exchange-0.0.3.gem",
        "homepage_uri"=>"https://github.com/databyday/gtfs-data-exchange-api-ruby",
        "wiki_uri"=>"https://github.com/databyday/gtfs-data-exchange-api-ruby/wiki",
        "documentation_uri"=>"",
        "mailing_list_uri"=>"",
        "source_code_uri"=>"https://github.com/databyday/gtfs-data-exchange-api-ruby",
        "bug_tracker_uri"=>"https://github.com/databyday/gtfs-data-exchange-api-ruby/issues",
        "dependencies"=>{
          "development"=>
           [{"name"=>"bundler", "requirements"=>"~> 1.7"},
            {"name"=>"pry", "requirements"=>"~> 0.10"},
            {"name"=>"rake", "requirements"=>"~> 10.0"},
            {"name"=>"rspec", "requirements"=>"~> 3.1"}],
          "runtime"=>[{"name"=>"httparty", "requirements"=>"~> 0.13"}]
        },
        "versions"=>[
          {
            "authors"=>"MJ Rossetti (@s2t2)",
            "built_at"=>"2014-11-30T00:00:00Z",
            "description"=>"A ruby wrapper for the gtfs-data-exchange.com api (http://www.gtfs-data-exchange.com/api). List all agencies, or find a specific agency by its data exchange identifier.",
            "downloads_count"=>70,
            "number"=>"0.0.3",
            "summary"=>"A ruby wrapper for the gtfs-data-exchange.com api (http://www.gtfs-data-exchange.com/api).",
            "platform"=>"ruby",
            "ruby_version"=>">= 0",
            "prerelease"=>false,
            "licenses"=>["MIT"],
            "requirements"=>[]
          },
          {
            "authors"=>"MJ Rossetti (@s2t2)",
            "built_at"=>"2014-11-28T00:00:00Z",
            "description"=>"A ruby wrapper for the [gtfs-data-exchange.com api](http://www.gtfs-data-exchange.com/api). List all agencies, or find a specific agency by its `dataexchange_id`.",
            "downloads_count"=>91,
            "number"=>"0.0.2",
            "summary"=>"A ruby wrapper for the [gtfs-data-exchange.com api](http://www.gtfs-data-exchange.com/api).",
            "platform"=>"ruby",
            "ruby_version"=>">= 0",
            "prerelease"=>false,
            "licenses"=>["MIT"],
            "requirements"=>[]},
          {
            "authors"=>"MJ Rossetti (@s2t2)",
            "built_at"=>"2014-11-27T00:00:00Z",
            "description"=>"Exposes the `agencies` and `agency` endpoints.",
            "downloads_count"=>97,
            "number"=>"0.0.1",
            "summary"=>"A ruby wrapper for the [gtfs-data-exchange.com api](http://www.gtfs-data-exchange.com/api).",
            "platform"=>"ruby",
            "ruby_version"=>">= 0",
            "prerelease"=>false,
            "licenses"=>["MIT"],
            "requirements"=>[]
          }]
        },
        {
          "name"=>"gtfs-meta",
          "downloads"=>103,
          "version"=>"0.0.1",
          "version_downloads"=>103,
          "platform"=>"ruby",
          "authors"=>"MJ Rossetti",
          "info"=>"Extracts feed data, manages feed versions, and extends the feed specification to include feed metadata.",
          "licenses"=>["MIT"],
          "project_uri"=>"http://rubygems.org/gems/gtfs-meta",
          "gem_uri"=>"http://rubygems.org/gems/gtfs-meta-0.0.1.gem",
          "homepage_uri"=>"https://github.com/databyday/gtfs-meta",
          "wiki_uri"=>nil,
          "documentation_uri"=>nil,
          "mailing_list_uri"=>nil,
          "source_code_uri"=>nil,
          "bug_tracker_uri"=>nil,
          "dependencies"=>
           {"development"=>[{"name"=>"bundler", "requirements"=>"~> 1.7"}, {"name"=>"rake", "requirements"=>"~> 10.0"}],
            "runtime"=>[{"name"=>"activerecord", "requirements"=>"~> 4.0.2"}, {"name"=>"gtfs", "requirements"=>"~> 0.2.4"}]},
          "versions"=>[
            {
              "authors"=>"MJ Rossetti",
              "built_at"=>"2014-11-23T00:00:00Z",
              "description"=>"Extracts feed data, manages feed versions, and extends the feed specification to include feed metadata.",
              "downloads_count"=>103,
              "number"=>"0.0.1",
              "summary"=>"A GTFS data and metadata manager for ActiveRecord.",
              "platform"=>"ruby",
              "ruby_version"=>">= 0",
              "prerelease"=>false,
              "licenses"=>["MIT"],
              "requirements"=>[]
            }
          ]
        }
      ]
=end
  def self.owned_gems_and_versions
    result = []
    Gems.gems.each do |rubygem|
      versions = Gems.versions(rubygem["name"])
      rubygem.merge!("versions" => versions)
      result << rubygem
    end
    return result
  end
end

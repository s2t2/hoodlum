class CreateRubygems < ActiveRecord::Migration
  def change
    create_table :rubygems do |t|
      t.string :name, :null => false
      t.string :platform
      t.string :ruby_version
      #t.integer :download_count
      #t.string :current_version_number
      #t.integer :current_version_download_count
      t.string :authors
      t.text :info
      t.text :licenses
      t.text :project_uri
      t.text :gem_uri
      t.text :homepage_uri
      t.text :wiki_uri
      t.text :documentation_uri
      t.text :mailing_list_uri
      t.text :source_code_uri
      t.text :bug_tracker_uri
      t.text :dependencies
      t.timestamps
    end

    add_index :rubygems, :name, :unique => true
  end
end

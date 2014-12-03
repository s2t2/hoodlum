class CreateRubygemVersions < ActiveRecord::Migration
  def change
    create_table :rubygem_versions do |t|
      t.string :rubygem_name, :null => false
      t.string :number, :null => false
      t.text :authors
      t.datetime :built_at
      t.text :description
      t.string :summary
      t.string :platform
      t.string :ruby_version
      t.boolean :prerelease
      t.text :licenses
      t.text :requirements
      t.timestamps
    end

    add_index :rubygem_versions, :rubygem_name
    add_index :rubygem_versions, :number
  end
end

class CreateRubygemDownloadCounts < ActiveRecord::Migration
  def change
    create_table :rubygem_download_counts do |t|
      t.integer :rubygem_id, :null => false
      t.integer :total_downloads, :null => false
      t.timestamps
    end

    add_index :rubygem_download_counts, :rubygem_id
  end
end

class CreateListedUrls < ActiveRecord::Migration
  def change
    create_table :listed_urls do |t|
      t.string :title
      t.string :url
      t.integer :listed_type
      t.integer :graph_id
      
      t.timestamps
    end
  end
end

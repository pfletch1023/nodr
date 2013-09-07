class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :parent_id
      t.string :parent_type
      t.integer :node_id
      t.integer :session_id

      t.timestamps
    end
  end
end

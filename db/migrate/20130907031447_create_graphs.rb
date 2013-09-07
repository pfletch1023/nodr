class CreateGraphs < ActiveRecord::Migration
  def change
    create_table :graphs do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.datetime :end_at
      
      t.timestamps
    end
  end
end

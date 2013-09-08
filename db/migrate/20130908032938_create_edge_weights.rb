class CreateEdgeWeights < ActiveRecord::Migration
  def change
    create_table :edge_weights do |t|
      t.integer :parent_id
      t.integer :child_id
      t.float :value
    end
    
    change_table :nodes do |t|
      t.text :topics
    end
  end
end

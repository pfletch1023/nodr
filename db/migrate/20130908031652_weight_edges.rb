class WeightEdges < ActiveRecord::Migration
  def change
    change_table :links do |t|
      t.float :value
    end
  end
end

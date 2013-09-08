class ChangeLinkValues < ActiveRecord::Migration
  def change
    change_table :links do |t|
      t.remove :value
      t.integer :link_type
    end
  end
end

class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.datetime :end_at
      
      t.timestamps
    end
  end
end

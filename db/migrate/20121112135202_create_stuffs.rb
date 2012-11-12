class CreateStuffs < ActiveRecord::Migration
  def change
    create_table :stuffs do |t|
      t.integer :created_by, :null => false
      t.string :name, :null => false
      t.timestamps
    end
  end
end

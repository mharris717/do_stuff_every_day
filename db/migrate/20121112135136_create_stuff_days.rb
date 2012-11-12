class CreateStuffDays < ActiveRecord::Migration
  def change
    create_table :stuff_days do |t|
      t.references :stuff
      t.references :user
      
      t.date :day
      t.float :amount
      
      t.timestamps
    end
  end
end

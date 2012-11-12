class CreateStuffSchedules < ActiveRecord::Migration
  def change
    create_table :stuff_schedules do |t|
      t.references :stuff
      t.integer :created_by, :null => false
      t.float :target_amount
      t.timestamps
    end
  end
end

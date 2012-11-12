class CreateStuffScheduleSubscriptions < ActiveRecord::Migration
  def change
    create_table :stuff_schedule_subscriptions do |t|
      t.references :user
      t.references :stuff
      t.timestamps
    end
  end
end

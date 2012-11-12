class CreateStuffScheduleSubscriptions < ActiveRecord::Migration
  def change
    create_table :stuff_schedule_subscriptions do |t|
      t.references :user
      t.references :stuff_schedule
      t.timestamps
    end
  end
end

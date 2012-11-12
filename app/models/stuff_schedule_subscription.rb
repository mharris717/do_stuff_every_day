class StuffScheduleSubscription < ActiveRecord::Base
  belongs_to :stuff_schedule
  belongs_to :user
end

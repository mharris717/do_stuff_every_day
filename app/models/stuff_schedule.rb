class StuffSchedule < ActiveRecord::Base
  belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
  belongs_to :stuff
  
  has_many :stuff_schedule_subscriptions
  def subs; stuff_schedule_subscriptions; end
end
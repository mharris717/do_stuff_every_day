class Stuff < ActiveRecord::Base
  belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
  has_many :schedules, :class_name => "StuffSchedule"
  has_many :stuff_schedule_subscriptions, :through => :schedules
  def subs; stuff_schedule_subscriptions; end
end

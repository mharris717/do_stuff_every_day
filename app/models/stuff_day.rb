class StuffDay < ActiveRecord::Base
  belongs_to :stuff
  belongs_to :user
  
  scope :between, (lambda do |start_day,end_day| 
    { :conditions => ["day between ? and ?", start_day,end_day] } 
  end)
end

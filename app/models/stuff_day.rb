class StuffDay < ActiveRecord::Base
  belongs_to :stuff
  belongs_to :user
end

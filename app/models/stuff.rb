class Stuff < ActiveRecord::Base
  belongs_to :creator, :class_name => "User", :foreign_key => "created_by"
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :registerable, :database_authenticatable, 
         :rememberable, :trackable, :validatable,
         :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :remember_me
  attr_accessible :provider, :uid
  attr_accessible :password, :first_name, :last_name
  
  has_many :stuff_schedule_subscriptions
  has_many :stuff_schedules, :through => :stuff_schedule_subscriptions
  has_many :stuffs, :through => :stuff_schedules
  has_many :stuff_days
  
  class << self
    def create_with_omniauth(auth)
      create! do |user|
        user.provider = auth['provider']
        user.uid = auth['uid']
        user.email = auth['info']['email']
        user.first_name = auth['info']['first_name']
        user.last_name = auth['info']['last_name']
        user.password = Devise.friendly_token[0,20]
      end
    end
    
    def find_for_facebook_oauth(auth,signed_in_resource=nil)
      user = User.where(:provider => auth['provider'], :uid => auth['uid']).first
      user ||= create_with_omniauth(auth)
      user
    end
  end
end

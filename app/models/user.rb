class User < ApplicationRecord

  devise :database_authenticatable, 
          :rememberable, :trackable, :authentication_keys => [:email, :username]
  include DeviseTokenAuth::Concerns::User
  has_friendship

  mount_uploader :avatar, AvatarUploader


  has_many :volunteers
  has_many :published_volunteers, class_name: "Volunteer", foreign_key: "volunteer_id"


  
end

class User < ActiveRecord::Base
  attr_accessible :avatar, :email, :first_name, :last_name, :provider, :uid

  validates_presence_of :avatar, :email, :first_name, :last_name, :provider, :uid

  def self.create_with_omniauth(auth)
  	create! do |user|
  		user.provider = auth["provider"]
  		user.uid = auth["uid"]
  		if user.provider == "facebook"
  			user.avatar = auth["info"]["image"]
  			user.first_name = auth["info"]["first_name"]
  			user.last_name = auth["info"]["last_name"]
  			user.email = auth["info"]["email"]
  		end
  		if !user.avatar
  			user.avatar = "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email.strip.downcase)}"
  		end
  	end
  end
end

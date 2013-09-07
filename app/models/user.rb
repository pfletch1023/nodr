class User < ActiveRecord::Base
  
  attr_accessible :admin, :avatar, :email, :first_name, :last_name, :provider, :uid, :oauth_token, :oauth_expires_at
  
  has_many :graphs
  
  validates_presence_of :avatar, :email, :first_name, :last_name, :provider, :uid, :oauth_token, :oauth_expires_at

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      if user.provider == "facebook"
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        user.email = auth.info.email
        user.avatar = auth.info.image
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      end
      if !user.avatar
        user.avatar = "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email.strip.downcase)}"
      end
      user.admin = false #user.admin_id?
      user.save!
    end
  end

  def admin_id?
    admins = { "facebook" => ["594889925"] }
    admins[self.provider].include?(self.uid)
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(self.oauth_token)
  end

  def fb_expired?
    self.oauth_expires_at < DateTime.now
  end
end

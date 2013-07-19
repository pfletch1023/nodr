class User < ActiveRecord::Base
  attr_accessible :admin, :avatar, :email, :first_name, :last_name, :provider, :uid

  validates_presence_of :admin, :avatar, :email, :first_name, :last_name, :provider, :uid

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      if user.provider == "facebook"
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        user.email = auth.info.email
        user.avatar = auth.info.image
      end
      if !user.avatar
        user.avatar = "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email.strip.downcase)}"
      end
      user.admin = user.admin_id?
      user.save!
    end
  end

  def admin_id?
    admins = { "facebook" => ["594889925"] }
    admins[self.provider].include?(self.uid)
  end
end

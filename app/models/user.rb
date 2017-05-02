class User < ApplicationRecord
  # Associations
  has_many :likes, dependent: :destroy

  # Class methods
  def self.find_or_create_from_omniauth(auth_hash)
    user = find_by(provider: auth_hash['provider'], uid: auth_hash['uid']) || create_from_omniauth(auth_hash)
  end

  def self.create_from_omniauth(auth_hash)
    create! do |user|
      user.provider = auth_hash['provider']
      user.uid = auth_hash['uid']
      user.fullname = auth_hash['info']['name']
      user.avatar = auth_hash['info']['image']
      user.token = auth_hash['credentials']['token']
      user.token_secret = auth_hash['credentials']['secret']
    end
  end
end

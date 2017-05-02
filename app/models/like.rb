class Like < ApplicationRecord
  # Associations
  belongs_to :user

  # Class methods
  def self.like_photo(user_id, photo_id)
    begin
      user = User.find(user_id)
      client = F00px::Client.new
      client.token = user.token
      client.token_secret = user.token_secret

      # Fire API & Update votes count
      client.post("photos/#{photo_id}/vote")

      # Create local like object
      like = Like.create!(user_id: user_id, photo_id: photo_id)
      return like
    rescue StandardError => e
      # Use puts here instead of flash message to prevent API problem
      # from leading users to an error page
      puts [e.message]
    end
  end

  def self.unlike_photo(user_id, photo_id)
    begin
      user = User.find(user_id)
      client = F00px::Client.new
      client.token = user.token
      client.token_secret = user.token_secret

      # Fire API & Update votes count
      # Got an error: undefined method `delete' for #<F00px::Client:0x007ffe312397b8>
      # when performing the code below.
      # Ref: https://github.com/500px/f00px/blob/3fbf64f6f980e8370060b4d9eeaa024c4f07b532/lib/f00px/request.rb
      client.delete("photos/#{photo_id}/vote")

      # Delete local like object
      like = Like.find_by(user_id: user.id, photo_id: photo_id)
      like.destroy
    rescue StandardError => e
      # Use puts here instead of flash message to prevent API problem
      # from leading users to an error page
      puts [e.message]
    end
  end
end

class LikesController < ApplicationController
  before_action :ensure_logged_in

  def create
    # Bad choice of checking if the user has liked a specific photo
    # but since the API only returns the short form of photos hash
    # where each individual photo hash doesn't contain the 
    # 'voted' boolean variable, this is an alternative of checking
    # if a photo is liked and make sure the user can't like the 
    # same photo twice.
    unless current_user.likes.where(photo_id: params[:photo_id]).first
      Like.like_photo(current_user.id, params[:photo_id])
    end
    redirect_back(fallback_location: photos_path)
  end

  def delete
    # Same as above stated
    if current_user.likes.where(photo_id: params[:photo_id]).first
      Like.unlike_photo(current_user.id, params[:photo_id])
    end
    redirect_back(fallback_location: photos_path)
  end
end

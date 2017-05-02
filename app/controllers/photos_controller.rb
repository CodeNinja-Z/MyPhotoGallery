class PhotosController < ApplicationController
  # Rails 5 changed the skip_xxx_action implementation.
  # Adding raise: false to avoid the method not defined error.
  # Ref: https://github.com/plataformatec/devise/issues/4207
  skip_before_action :ensure_logged_in, only: [:landing], raise: false
  
  def landing
    render template: 'photos/log_in', layout: 'layouts/landing_page'
  end

  def index
    @photos = Photo.get_top_hundred
  end

  def show
    @photo = Photo.find(params[:id])
  end
end

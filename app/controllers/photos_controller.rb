class PhotosController < ApplicationController
  # Rails 5 changed the skip_xxx_action implementation.
  # Adding raise: false to avoid the method not defined error.
  # Ref: https://github.com/plataformatec/devise/issues/4207
  skip_before_action :ensure_logged_in, only: [:landing], raise: false
  
  def landing
    render template: 'photos/log_in', layout: 'layouts/landing_page'
  end

  def index
    response = Photo.get_top_hundred
    data = JSON.parse(response)

    # Create Ruby objects based on each JSON photo object and save them temporarily
    @photos = data['photos'].map do |photo| 
                Photo.new(photo)
              end
  end
end

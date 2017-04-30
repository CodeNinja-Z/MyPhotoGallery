class PhotosController < ApplicationController
  def index
    response = Photo.get_top_hundred
    data = JSON.parse(response)

    # Create Ruby objects based on each JSON photo object and save them temporarily
    @photos = data['photos'].map do |photo| 
                Photo.new(photo)
              end
  end
end

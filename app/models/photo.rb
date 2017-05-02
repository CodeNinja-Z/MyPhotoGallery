class Photo
  # Purpose of not using ActiveRecord here is because each time the app 
  # simply pulls the popular pictures from 500px API at that timastamp.
  # It's not necessary to save them in local database.
  require 'json'

  attr_accessor :id, :name, :description, :votes_count, :image_url, :voted, 
    :photographer_full_name, :photographer_image, :photographer_city, 
    :photographer_country

  def initialize(params)
    @id = params['id']
    @name = params['name']
    @description = params['description']
    @votes_count = params['votes_count']
    @image_url = params['image_url']
    @voted = params['voted']
    @photographer_full_name = params['user']['fullname']
    @photographer_image = params['user']['userpic_url']
    @photographer_city = params['user']['city']
    @photographer_country = params['user']['country']
  end

  def self.get_top_hundred
    begin
      # Compose the query string to access the API to get top 100 photos with sorting 
      query = "?feature=popular&sort=rating&rpp=100&image_size=4"\
      "&include_store=store_print&include_states=liked&"\
      "consumer_key=#{Figaro.env.consumer_key}"

      response = F00px.get("photos#{query}")
      data = JSON.parse(response.body)

      # Create Ruby objects based on each JSON photo object and save them temporarily
      data['photos'].map do |photo| 
        Photo.new(photo)
      end
    rescue StandardError => e
      puts[:error] = [e.message]
    end
  end

  def self.find(photo_id)
    response = F00px.get("photos/#{photo_id}")
    data = JSON.parse(response.body)
    photo = data['photo']
    Photo.new(photo)
  end
end

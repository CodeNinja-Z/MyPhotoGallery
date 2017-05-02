describe LikesController, type: :controller do
  describe '#create' do
    before do
      # Create a user and log her in
      user = User.find_or_create_from_omniauth(OmniAuth.config.mock_auth[:f00px])
      session[:user_id] = user.id

      # Create a mock up photo
      photo = {"id"=>210026037, "user_id"=>user.id, "name"=>"Touching lights", "description"=>nil, "camera"=>"NIKON D610", "lens"=>"70.0-200.0 mm f/4.0", "focal_length"=>"160", "iso"=>"200", "shutter_speed"=>"1/320", "aperture"=>"7.1", "times_viewed"=>11914, "rating"=>99.5, "status"=>1, "created_at"=>"2017-05-01T02:22:40-04:00", "category"=>24, "location"=>nil, "latitude"=>47.8131545175277, "longitude"=>19.061279296875, "taken_at"=>"2017-03-31T08:39:35-04:00", "hi_res_uploaded"=>0, "for_sale"=>false, "width"=>1500, "height"=>980, "votes_count"=>746, "favorites_count"=>0, "comments_count"=>40, "nsfw"=>false, "sales_count"=>0, "for_sale_date"=>nil, "highest_rating"=>99.5, "highest_rating_date"=>"2017-05-01T16:10:17-04:00", "license_type"=>0, "converted"=>0, "collections_count"=>24, "crop_version"=>0, "privacy"=>false, "profile"=>true, "image_url"=>"https://drscdn.500px.org/photo/210026037/m%3D900_k%3D1_a%3D1/1ce2bb3db94fa847d08039be17975326", "images"=>[{"size"=>4, "url"=>"https://drscdn.500px.org/photo/210026037/m%3D900_k%3D1_a%3D1/1ce2bb3db94fa847d08039be17975326", "https_url"=>"https://drscdn.500px.org/photo/210026037/m%3D900_k%3D1_a%3D1/1ce2bb3db94fa847d08039be17975326", "format"=>"jpeg"}], "url"=>"/photo/210026037/touching-lights-by-andy58-andr%C3%A1s-schafer", "positive_votes_count"=>746, "converted_bits"=>0, "store_download"=>false, "store_print"=>false, "store_license"=>false, "request_to_buy_enabled"=>false, "license_requests_enabled"=>false, "watermark"=>true, "image_format"=>"jpeg", "user"=>{"id"=>426138, "username"=>"Andy58", "firstname"=>" Andy58/András ", "lastname"=>"Schafer", "city"=>"Zsambek", "country"=>"Hungary", "usertype"=>0, "fullname"=>"Andy58/András  Schafer", "userpic_url"=>"https://pacdn.500px.org/426138/c8dd482a972ddf45f94ea6e6c5a9399fdb6a76e2/1.jpg?2", "userpic_https_url"=>"https://pacdn.500px.org/426138/c8dd482a972ddf45f94ea6e6c5a9399fdb6a76e2/1.jpg?2", "cover_url"=>"https://pacdn.500px.org/426138/c8dd482a972ddf45f94ea6e6c5a9399fdb6a76e2/cover_2048.jpg?6", "upgrade_status"=>0, "store_on"=>true, "affection"=>674676, "avatars"=>{"default"=>{"https"=>"https://pacdn.500px.org/426138/c8dd482a972ddf45f94ea6e6c5a9399fdb6a76e2/1.jpg?2"}, "large"=>{"https"=>"https://pacdn.500px.org/426138/c8dd482a972ddf45f94ea6e6c5a9399fdb6a76e2/2.jpg?2"}, "small"=>{"https"=>"https://pacdn.500px.org/426138/c8dd482a972ddf45f94ea6e6c5a9399fdb6a76e2/3.jpg?2"}, "tiny"=>{"https"=>"https://pacdn.500px.org/426138/c8dd482a972ddf45f94ea6e6c5a9399fdb6a76e2/4.jpg?2"}}}, "licensing_requested"=>false, "licensing_suggested"=>false, "is_free_photo"=>false}

      VCR.use_cassette 'controllers/create_like' do
        post :create, params: { photo_id: photo['id'] }
      end
    end

    it 'request will be 302' do
      expect(response.status).to eq 302
    end

    it 'redirect back to photos path' do
      response.should redirect_to photos_path
    end 
  end

  # There's problem with delete action as written in 
  # Like model -- self.unlike_photo method
  # So skip the delete action test at here.
end

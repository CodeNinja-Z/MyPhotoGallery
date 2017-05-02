describe '.get_top_hundred', type: :request do
  it 'on success' do
    VCR.use_cassette 'requests/get_popular_photos' do
      photos = Photo.get_top_hundred

      expect(photos).to be_an_instance_of(Array)
      expect(photos.count).to eq 100
    end
  end
end
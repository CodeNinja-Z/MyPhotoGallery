describe '.get_top_hundred', type: :request do
  it 'on success' do
    VCR.use_cassette 'top_hundred_photos' do
      response = Photo.get_top_hundred
      data = JSON.parse(response)

      expect(data).to be_an_instance_of(Hash)
      expect(data['photos']).to be_an_instance_of(Array)
      expect(data['photos'].count).to eq 100

      # expect(photos).to be_an_instance_of(Array)
      # expect(photos.count).to eq 100
    end
  end
end
describe '.find', type: :request do
  it 'on success' do
    VCR.use_cassette 'requests/find_photo' do
      photo = Photo.find('210026037')

      expect(photo).to be_an_instance_of(Photo)
    end
  end
end
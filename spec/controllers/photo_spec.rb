describe PhotosController, type: :controller do
  describe '#index' do
    render_views
    before do
      VCR.use_cassette 'controllers/index' do
        get :index
      end
    end

    # it { should have_http_status 200 }
    it 'request will be 200 OK' do
      expect(response.status).to eq 200 
    end

    it 'display the template' do
      expect(response).to render_template :index
    end 
  end
end

describe PhotosController, type: :controller do
  describe '#index' do
    render_views

    before do
      VCR.use_cassette 'controllers/photos_index' do
        get :index
      end
    end

    it 'request will be 200 OK' do
      expect(response.status).to eq 200 
    end

    it 'display the template' do
      expect(response).to render_template :index
    end 
  end

  describe '#landing' do
    before { get :landing }

    it 'request will be 200 OK' do
      expect(response.status).to eq 200 
    end

    it 'display the template' do
      expect(response).to render_template :log_in
    end 
  end

  describe '#show' do
    render_views

      before { 
        VCR.use_cassette 'controllers/photos_show' do
          # photo with id 210026037
          get :show, params: { id: '210026037' } 
        end
      }

    it 'request will be 200 OK' do
      expect(response.status).to eq 200 
    end

    it 'display the template' do
      expect(response).to render_template :show
    end
  end
end

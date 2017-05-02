# Ref: https://www.natashatherobot.com/rails-test-omniauth-sessions-controller/

describe SessionsController, type: :controller do 
  before do
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:f00px]
  end
 
  describe "#create" do
    it "should successfully create a user" do
      expect {
        post :create, provider: '500px'
      }.to change{ User.count }.by(1)
    end
 
    it "should successfully create a session" do
      session[:user_id].should be_nil
      post :create, provider: '500px'
      session[:user_id].should_not be_nil
    end
 
    it "should redirect the user to the designated url" do
      post :create, provider: '500px'
      response.should redirect_to photos_path
    end
  end
 
  describe "#destroy" do
    before do
      post :create, provider: '500px'
    end
 
    it "should clear the session" do
      session[:user_id].should_not be_nil
      delete :destroy
      session[:user_id].should be_nil
    end
 
    it "should redirect to the home page" do
      delete :destroy
      response.should redirect_to root_path
    end
  end
end
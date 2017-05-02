describe User, type: :model do
  describe '#find_or_create_from_omniauth' do
    subject(:user) {
      User.find_or_create_from_omniauth(OmniAuth.config.mock_auth[:f00px])
    }

    it 'successfully create a user' do
      user.should be_valid
    end
  end
end

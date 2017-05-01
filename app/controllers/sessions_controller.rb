class SessionsController < ApplicationController
  # References: 
  # Ominiauth gem, https://github.com/omniauth/omniauth#integrating-omniauth-into-your-application
  # Railscast PRO #241 Simple OmniAuth, https://www.youtube.com/watch?v=KOnRf1K6Eg8       
  def create
    user = User.find_or_create_from_omniauth(auth_hash)
    session[:user_id] = user.id
    redirect_to photos_path, notice: "Welcome, #{user.fullname}!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end

  private
  def auth_hash
    request.env['omniauth.auth']
  end
end
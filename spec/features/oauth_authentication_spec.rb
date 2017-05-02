feature "access photos page", type: :request do
  scenario "can sign in user with 500px account" do
    visit root_path
    page.should have_content("Join Now. Beauty Awaits You.")
    auth_hash = OmniAuth.config.mock_auth[:f00px]
    # click_button "Take Me There"
    # page.should have_css('h2', :class => 'caption')
    # page.should have_link("Log Out")
  end

  scenario "can handle authentication error" do
    auth_hash = OmniAuth.config.mock_auth[:invalid]
    visit root_path
    page.should have_content("Join Now. Beauty Awaits You.")
    # click_button "Take Me There"
    # page.should_not have_link("Log Out")
  end
end
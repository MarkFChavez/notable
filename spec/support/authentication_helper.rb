module AuthenticationHelper
  def signin(user)
    visit signin_path

    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_on "Sign in"
  end
end

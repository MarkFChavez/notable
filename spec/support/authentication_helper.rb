module AuthenticationHelper
  def signin(user)
    visit signin_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_on "Sign in"
  end
end

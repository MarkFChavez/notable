require "rails_helper"

RSpec.describe "Logging in" do
  context "with valid credentials" do
    let(:user) { create(:user) }

    it "shows me the dashboard page" do
      visit signin_path
  
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_on "Sign in"

      expect(page).to have_selector ".user-email", text: user.email
    end
  end
end

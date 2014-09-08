require "rails_helper"

RSpec.describe "Logging in" do
  context "with valid credentials" do
    let(:user) { create(:user) }
    before(:each) { signin user }

    it "shows me the dashboard page" do
      expect(page).to have_selector ".user-email", text: user.email
    end

    it "shows me a notice message" do
      expect(page).to have_content "Signed in successfully"
    end
  end

  context "with invalid credentials" do
    let(:invalid_user) { build_stubbed(:user) }

    it "shows an error message" do
      signin invalid_user

      expect(page).to have_content "Invalid email or password"
    end
  end
end

require "rails_helper"

RSpec.describe "Logging in" do
  context "with valid credentials" do
    let(:user) { create(:user) }

    it "shows me the dashboard page" do
      signin user

      expect(page).to have_selector ".user-email", text: user.email
    end

    it "shows me a notice message" do
      signin user

      expect(page).to have_content "Signed in successfully"
    end
  end
end

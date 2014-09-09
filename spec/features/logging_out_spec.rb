require "rails_helper"

RSpec.describe "Logging out" do
  let(:user) { create(:user) }

  it "goes back to signin page" do
    signin user
    click_on "Logout"

    expect(page).to have_content "Signed out successfully"
  end
end

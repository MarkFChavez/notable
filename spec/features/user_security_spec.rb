require "rails_helper"

RSpec.describe "User authentication security" do
  context "as a signed in user" do
    let(:user) { create(:user) }

    it "allows me to go to dashboard" do
      signin user
      visit dashboard_url
      
      expect(current_path).to eq dashboard_path
    end
  end

  context "as a guest" do
    it "does not allow me to go to dashboard" do
      visit dashboard_url

      expect(current_path).to eq signin_path
    end
  end
end

require "rails_helper"

RSpec.describe SessionsController do
  it "does not allow logged in users" do
    user = double("user", email: "mchavez@you-source.com")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    get :new
    expect(response).to redirect_to dashboard_url
  end
end

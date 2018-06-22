require 'rails_helper'

context "as a visitor" do
  let(:user) { FactoryBot.create(:app_user) }
  let(:admin) { FactoryBot.create(:admin_app) }
  it "I cannot access any user dashboard or admin dashboard" do
    visit dashboard_path(user)

    expect(current_path).to eq signin_path

    visit dashboard_path(admin)

    expect(current_path).to eq signin_path
  end
end

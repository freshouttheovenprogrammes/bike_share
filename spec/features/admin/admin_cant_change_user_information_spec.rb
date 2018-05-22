require 'rails_helper'

context "as an admin" do
  let(:user) { FactoryBot.create(:app_user) }
  let(:admin) { FactoryBot.create(:admin_app) }
  before(:each) do
    visit signin_path

    fill_in "username", with: admin.username
    fill_in "password", with: admin.app_credential.password
    click_on "Submit"
  end
  it "i cannot change another users profile" do
    visit edit_user_path(user)

    expect(status_code).to eq 404
  end
end

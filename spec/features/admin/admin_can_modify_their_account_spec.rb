require 'rails_helper'

context "as an admin" do
  let(:admin) { FactoryBot.create(:admin_app) }

  before(:each) do
    visit signin_path

    fill_in "username", with: admin.username
    fill_in "password", with: admin.app_credential.password
    click_on "Submit"
  end
  it "i can edit my own account" do
    click_link "Edit Account Details"

    fill_in "user[first_name]", with: "changed"
    fill_in "user[last_name]", with: "new name"
    fill_in "user[email]", with: "new.email@gmail.com"
    fill_in "user[username]", with: "pineapple-pen"
    fill_in "user[password]", with: "crazyasspassword"

    click_on "Update Profile"

    expect(current_path).to eq dashboard_path(admin)
    expect(page).to have_content "changed"
    expect(page).to have_content "new name"
    expect(page).to have_content "new.email@gmail.com"
    expect(page).to have_content "pineapple-pen"
  end
end

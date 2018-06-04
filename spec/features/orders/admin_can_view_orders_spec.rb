require 'rails_helper'

describe "As a regular user" do
  context "when I go to the orders page" do
    let(:app_user)  { FactoryBot.create(:app_user) }
    before(:each) do
      visit signin_path
      fill_in "username", with: app_user.username
      fill_in "password", with: app_user.app_credential.password

      click_on "Submit"
    end
      it "I cannot see all orders" do
        FactoryBot.create(:order_ordered)
        visit admin_orders_path(app_user)

        expect(status_code).to eq 404
    end
  end
end

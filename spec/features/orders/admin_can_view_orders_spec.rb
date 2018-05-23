require 'rails_helper'

describe "As a regular user" do
  context "when I go to the orders page" do
    let(:app_user)  { FactoryBot.create(:app_user) }
    # let(:order) { FactoryBot.create(:order_ordered) }
    # let(:order2) { FactoryBot.create(:order_ordered) }
    # let(:order3) { FactoryBot.create(:order_ordered) }
    before(:each) do
      visit signin_path
      fill_in "username", with: app_user.username
      fill_in "password", with: app_user.app_credential.password

      click_on "Submit"
    end
      it "I cannot see all orders" do
        Order.create!(total: 100, status: "Ordered", user: app_user)
        visit orders_path

        expect(status_code).to eq 404
    end
  end
end

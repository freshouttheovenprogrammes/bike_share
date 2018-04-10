require 'rails_helper'

RSpec.describe Order, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe Order, type: :model do
  describe "validations" do
    it {should validate_presence_of(:total)}
    it {should validate_presence_of(:status)}
  end
end

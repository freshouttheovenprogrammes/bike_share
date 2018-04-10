require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

describe Item, type: :model do
  describe "validations" do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:price)}
    it {should validate_presence_of(:status)}
  end
end

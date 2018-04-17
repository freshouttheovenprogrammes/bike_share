require 'rails_helper'

RSpec.describe Station, type: :model do
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:latitude)}
  it {should validate_presence_of(:longitude)}
  it {should validate_presence_of(:dock_count)}
  it {should validate_presence_of(:city)}
  it {should validate_presence_of(:installation_date)}

end

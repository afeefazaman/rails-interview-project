require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = build(:user)

    expect(user).to be_valid
  end

  it "is invalid with invalid attributes" do
    user = build(:user, name: nil)

    expect(user).to_not be_valid
  end
end

require 'rails_helper'

RSpec.describe Answer, type: :model do
  it "is valid with valid attributes" do
    answer = build(:answer)

    expect(answer).to be_valid
  end

  it "is invalid with invalid attributes" do
    answer = build(:answer, body: nil)

    expect(answer).to_not be_valid
  end
end

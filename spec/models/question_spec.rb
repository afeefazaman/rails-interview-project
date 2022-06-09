require 'rails_helper'

RSpec.describe Question, type: :model do
  it "is valid with valid attributes" do
    question = build(:question)

    expect(question).to be_valid
  end

  it "is invalid with invalid attributes" do
    question = build(:question, title: nil)

    expect(question).to_not be_valid
  end
end

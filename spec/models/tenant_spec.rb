require 'rails_helper'

RSpec.describe Tenant, type: :model do
  it "is valid with valid attributes" do
    tenant = build(:tenant)

    expect(tenant).to be_valid
  end

  it "is invalid with invalid attributes" do
    tenant = build(:tenant, name: nil)
    
    expect(tenant).to_not be_valid
  end
end

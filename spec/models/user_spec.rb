require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid' do
    u = FactoryGirl.build(:user)
    expect(u).to be_valid
  end

  it "with same email can't exist" do
    FactoryGirl.create(:user, email: 'test@t.com')
    u = FactoryGirl.build(:user, email: 'test@t.com')
    expect(u).not_to be_valid
    expect(u.errors).to include(:email)
  end

  it 'is invalid without required fields' do
    required_fields = [:email, :password, :password_confirmation]

    required_fields.each do |field|
      u = FactoryGirl.build(:user, field => '')
      expect(u).not_to be_valid
      expect(u.errors).to include(field)
    end
  end
end

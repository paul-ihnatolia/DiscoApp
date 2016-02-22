require 'rails_helper'

RSpec.describe Photo, type: :model do
  it 'is valid' do
    p = FactoryGirl.build(:photo)

    expect(p).to be_valid
  end
end

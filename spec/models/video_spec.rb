require 'rails_helper'

RSpec.describe Video, type: :model do
  it 'is valid' do
    v = FactoryGirl.build(:video)
    expect(v).to be_valid
  end
end

require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'is valid' do
    e = FactoryGirl.build(:event)
    expect(e).to be_valid
  end
end

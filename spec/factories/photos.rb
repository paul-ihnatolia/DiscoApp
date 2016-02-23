FactoryGirl.define do
  factory :photo do
    content Rack::Test::UploadedFile.new(Rails.root + 'spec/data/test.png', 'image/png')
    is_cover false
    standalone false

    event
  end
end

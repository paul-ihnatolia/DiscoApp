FactoryGirl.define do
  factory :event do
    title "My event"
    event_date "2016-02-22"
    video_url "https://youtube.com/Yikhdasdsa89sd"
    is_prior false
    banner Rack::Test::UploadedFile.new(Rails.root + 'spec/data/test.png', 'image/png')
  end
end

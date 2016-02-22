class Video < ActiveRecord::Base
  enum video_type: {
    youtube: 1,
    vimeo:   2
  }
end

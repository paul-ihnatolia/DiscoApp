class Event < ActiveRecord::Base
  has_attached_file :banner, styles: { }
  validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/
end

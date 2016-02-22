class Photo < ActiveRecord::Base
  belongs_to :event

  has_attached_file :content, styles: { }
  validates_attachment_content_type :content, :content_type => /\Aimage\/.*\Z/
end
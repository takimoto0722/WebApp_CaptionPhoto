class Photograph < ApplicationRecord
  mount_uploader :image, ProcessedImageUploader

  validates :image,   presence: true
  validates :caption, presence: true, length: { maximum: 25 }
end

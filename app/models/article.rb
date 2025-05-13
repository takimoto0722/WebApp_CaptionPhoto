class Article < ApplicationRecord
    mount_uploader :thumbnail, ThumbnailUploader
    validates :title, :body, :published_on, presence: true
end

class Archive < ApplicationRecord
    mount_uploader :image, ProcessedImageUploader
end

class Picture < ApplicationRecord
  belongs_to :album
  mount_uploader :photo, PhotoUploader
end

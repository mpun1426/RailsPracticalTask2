class Room < ApplicationRecord
  mount_uploader :image, AvatarUploader
end

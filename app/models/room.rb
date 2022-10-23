class Room < ApplicationRecord
  validates :room_name, length: {minimum: 1}
  validates :room_address, length: {minimum: 2}
  validates :room_price, length: {minimum: 3}

  mount_uploader :image, AvatarUploader
end

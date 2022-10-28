class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations

  validates :room_name, length: {in: 1..25}
  validates :room_address, length: {in: 1..25}
  validates :room_price, length: {in: 1..9}
  validate :price_check

  def price_check
    if room_price.present?
      errors.add(:room_price, "は最低でも1円以上で設定してください") if self.room_price < 1
    end
  end

  mount_uploader :image, AvatarUploader
end

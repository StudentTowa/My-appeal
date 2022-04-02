class Sportspresent < ApplicationRecord
    belongs_to :user
    has_many :sportslikes, dependent: :destroy
    has_many :liked_users, through: :sportslikes, source: :user
    mount_uploader :image, ImageUploader

    has_many :sportscomments, dependent: :destroy
end
